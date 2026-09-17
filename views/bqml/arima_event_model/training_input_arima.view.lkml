view: training_input_arima {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql:
    SELECT
    (DATE(TIMESTAMP_MICROS(events.event_timestamp) )) AS sessions_session_date,
    events.event_name  AS events_event_name,
    COUNT(DISTINCT sessions.sl_key ) AS sum_of_session_event_count
FROM ${sessions.SQL_TABLE_NAME} AS sessions
LEFT JOIN UNNEST(sessions.event_data) as events with offset as event_row
WHERE ((( TIMESTAMP_MICROS(events.event_timestamp)  ) >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -89 DAY))) AND ( TIMESTAMP_MICROS(events.event_timestamp)  ) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -89 DAY), INTERVAL 90 DAY)))))
GROUP BY 1,2 ORDER BY 1 DESC;;
  }
  dimension: session_date_arima {
    hidden: yes
    type: date
    sql: ${TABLE}.sessions_session_date ;;
  }
 }
