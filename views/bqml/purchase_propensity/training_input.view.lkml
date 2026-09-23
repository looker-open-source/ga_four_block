include: "/views/sessions/*.view.lkml"
include: "/views/*/*.view.lkml"
view: training_input {
  derived_table: {

    datagroup_trigger: bqml_datagroup
    sql:
    WITH
      visitors_labeled AS (
        SELECT
          user_pseudo_id,
          MIN(
            CASE
            WHEN REGEXP_CONTAINS(event_name, 'purchase')
            THEN event_timestamp END) AS event_session,
          MIN(
            CASE
            WHEN REGEXP_CONTAINS(event_name, 'purchase')
            THEN event_date END) AS event_date,
          MAX(
            CASE
            WHEN REGEXP_CONTAINS(event_name, 'purchase')
            THEN 1
            ELSE 0 END) AS label
        FROM
          ${session_list_with_event_history.SQL_TABLE_NAME} AS GA
        WHERE
          DATE(session_date) > DATE_SUB(CURRENT_DATE(), INTERVAL (@{GA4_BQML_train_months} + @{GA4_BQML_test_months}) MONTH) AND DATE(session_date) <  DATE_SUB(CURRENT_DATE(), INTERVAL @{GA4_BQML_test_months} MONTH)
        GROUP BY
          user_pseudo_id
      ),
      visitor_location AS (
        SELECT
          GA.user_pseudo_id,
          MAX(geo.city) AS city,
          MAX(geo.region) AS region,
          MAX(geo.country) AS country
        FROM
          ${session_list_with_event_history.SQL_TABLE_NAME} AS GA
        LEFT JOIN visitors_labeled AS Labels
          ON GA.user_pseudo_id = Labels.user_pseudo_id
        WHERE
          DATE(session_date) > DATE_SUB(CURRENT_DATE(), INTERVAL (@{GA4_BQML_train_months} + @{GA4_BQML_test_months}) MONTH) AND DATE(session_date) <  DATE_SUB(CURRENT_DATE(), INTERVAL @{GA4_BQML_test_months} MONTH)
        AND (
          GA.event_timestamp < IFNULL(event_session, 0)
          OR event_session IS NULL)
        GROUP BY
          user_pseudo_id
      ),
      visitor_day_page_map AS (
        SELECT
          GA.user_pseudo_id,
          EXTRACT(DAYOFWEEK FROM PARSE_DATE('%Y%m%d', GA.event_date)) AS day,
          SUM(
            CASE
              WHEN event_name = 'page_view'
              THEN 1
              ELSE 0
            END)
          AS pages_viewed
        FROM
          ${session_list_with_event_history.SQL_TABLE_NAME} AS GA
        LEFT JOIN visitors_labeled AS Labels
          ON GA.user_pseudo_id = Labels.user_pseudo_id
        WHERE
          DATE(session_date) > DATE_SUB(CURRENT_DATE(), INTERVAL (@{GA4_BQML_train_months} + @{GA4_BQML_test_months}) MONTH) AND DATE(session_date) <  DATE_SUB(CURRENT_DATE(), INTERVAL @{GA4_BQML_test_months} MONTH)
        AND (
          GA.event_timestamp < IFNULL(event_session, 0)
          OR event_session IS NULL)
        GROUP BY
          1, 2
      ),
      visitor_common_day AS (
        SELECT
          user_pseudo_id,
          /* In the event of a tie, pick any of the top dates. */
          CASE
          WHEN ANY_VALUE(day) = 1 THEN 'Sunday'
          WHEN ANY_VALUE(day) = 2 THEN 'Monday'
          WHEN ANY_VALUE(day) = 3 THEN 'Tuesday'
          WHEN ANY_VALUE(day) = 4 THEN 'Wednesday'
          WHEN ANY_VALUE(day) = 5 THEN 'Thursday'
          WHEN ANY_VALUE(day) = 6 THEN 'Friday'
          WHEN ANY_VALUE(day) = 7 THEN 'Saturday'
          END AS day
        FROM
          visitor_day_page_map AS day_page_map
        WHERE day_page_map.pages_viewed = (
          SELECT MAX(pages_viewed)
          FROM visitor_day_page_map AS day_map
          WHERE day_page_map.user_pseudo_id = day_map.user_pseudo_id)
        GROUP BY 1
      ),
      event_cnts AS (
        SELECT
          GA.user_pseudo_id,
          SUM(IF(event_name = 'user_engagement', 1, 0)) AS cnt_user_engagement,
          SUM(IF(event_name = 'scroll', 1, 0)) AS cnt_scroll,
          SUM(IF(event_name = 'session_start', 1, 0)) AS cnt_session_start
          -- Uncomment, customize, and copy the line below to count specific events.
          -- SUM(IF(event_name = 'my custom event', 1, 0)) AS cnt_my_custom_event
          -- Don't forget to add a comma after 'cnt_session_start' when adding a new field.
        FROM
          ${session_list_with_event_history.SQL_TABLE_NAME} AS GA
        LEFT JOIN visitors_labeled AS Labels
          ON GA.user_pseudo_id = Labels.user_pseudo_id
        WHERE
          DATE(session_date) > DATE_SUB(CURRENT_DATE(), INTERVAL (@{GA4_BQML_train_months} + @{GA4_BQML_test_months}) MONTH) AND DATE(session_date) <  DATE_SUB(CURRENT_DATE(), INTERVAL @{GA4_BQML_test_months} MONTH)
        AND (
          GA.event_timestamp < IFNULL(event_session, 0)
          OR event_session IS NULL)
        GROUP BY 1
      ),
      engagement AS (
        SELECT
          user_pseudo_id,
          SAFE_DIVIDE(
            SUM(session_engaged),
            COUNT(DISTINCT session_id)
          ) AS engagement_rate,
          ROUND(SUM(engagement_time_msec)/1000) AS engagement_time_seconds,
          COUNT(DISTINCT session_id) AS total_sessions
        FROM (
          SELECT
            GA.user_pseudo_id,
            (
              SELECT value.int_value
              FROM UNNEST(event_params)
              WHERE key = 'ga_session_id'
            ) AS session_id,
            MAX((
              SELECT value.int_value
              FROM UNNEST(event_params)
              WHERE key = 'session_engaged'
            )) AS session_engaged,
            MAX((
              SELECT value.int_value
              FROM UNNEST(event_params)
              WHERE key = 'engagement_time_msec'
            )) AS engagement_time_msec
          FROM
            ${session_list_with_event_history.SQL_TABLE_NAME} AS GA
          LEFT JOIN visitors_labeled AS Labels
            ON GA.user_pseudo_id = Labels.user_pseudo_id
          WHERE
           DATE(session_date) > DATE_SUB(CURRENT_DATE(), INTERVAL (@{GA4_BQML_train_months} + @{GA4_BQML_test_months}) MONTH) AND DATE(session_date) <  DATE_SUB(CURRENT_DATE(), INTERVAL @{GA4_BQML_test_months} MONTH)
          AND (
            GA.event_timestamp < IFNULL(event_session, 0)
            OR event_session IS NULL)
          GROUP BY
            user_pseudo_id,
            session_id
        )
        GROUP BY user_pseudo_id
      ),
      user_model AS (
        SELECT
          GA.user_pseudo_id,
          IFNULL(MAX(label), 0) AS will_purchase_in_future,
          MAX(Visitor_location.country) AS visited_country,
          MAX(Visitor_location.region) AS visited_region,
          MAX(Visitor_location.city) AS visited_city,
          MAX(Visitor_common_day.day) AS visited_dow,
          SUM(
            CASE
              WHEN event_name = 'page_view'
              THEN 1
              ELSE 0 END) AS pageviews,
          MAX(device.operating_system) AS device_operating_system,
          MAX(device.operating_system_version) AS device_operating_system_version,
          MAX(device.category) AS device_category,
          MAX(device.web_info.browser) AS browser,
          MAX(traffic_source.medium) AS medium,
          MAX(traffic_source.source) AS source,
          COUNT(DISTINCT event_name) AS events,
          MAX(event_name) AS common_events,
          MAX(device.mobile_brand_name) AS device_mobile_brand_name,
          MAX(device.mobile_model_name) AS device_mobile_model_name,
          MAX(device.language) AS device_language,
          COUNT(DISTINCT EXTRACT(DAYOFWEEK FROM PARSE_DATE('%Y%m%d', GA.event_date)))
            AS num_diff_days_visited,
          IFNULL(MAX(Engagement.engagement_rate), 0) AS engagement_rate,
          IFNULL(MAX(Engagement.engagement_time_seconds), 0) AS engagement_time_seconds,
          IFNULL(MAX(Event_counts.cnt_user_engagement), 0) AS cnt_user_engagement,
          IFNULL(MAX(Event_counts.cnt_scroll), 0) AS cnt_scroll,
          IFNULL(MAX(Event_counts.cnt_session_start), 0) AS cnt_session_start
          -- Uncomment the field below to add your additional feature to the model.
          -- IFNULL(MAX(Event_counts.cnt_my_custom_event), 0) AS cnt_my_custom_event
          -- Don't forget to add a comma after 'cnt_session_start' when adding a new field.
        FROM
          ${session_list_with_event_history.SQL_TABLE_NAME} AS GA
        LEFT JOIN visitors_labeled AS Labels
          ON GA.user_pseudo_id = Labels.user_pseudo_id
        LEFT JOIN engagement AS Engagement
          ON GA.user_pseudo_id = Engagement.user_pseudo_id
        LEFT JOIN visitor_location AS Visitor_location
          ON GA.user_pseudo_id = Visitor_location.user_pseudo_id
        LEFT JOIN visitor_common_day AS Visitor_common_day
          ON GA.user_pseudo_id = Visitor_common_day.user_pseudo_id
        LEFT JOIN event_cnts AS Event_counts
          ON GA.user_pseudo_id = Event_counts.user_pseudo_id
        WHERE
          DATE(session_date) > DATE_SUB(CURRENT_DATE(), INTERVAL (@{GA4_BQML_train_months} + @{GA4_BQML_test_months}) MONTH) AND DATE(session_date) <  DATE_SUB(CURRENT_DATE(), INTERVAL @{GA4_BQML_test_months} MONTH)
          AND (
            GA.event_timestamp < IFNULL(event_session, 0)
            OR event_session IS NULL)
          AND platform IN ('WEB')
        GROUP BY
          GA.user_pseudo_id
      )
      SELECT
        *
      FROM user_model
      WHERE "@{BQML_PARAMETER}"='Yes' ;;
  }
}
