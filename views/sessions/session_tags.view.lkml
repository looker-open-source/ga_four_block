include: "/views/sessions/*.view.lkml"
###########################
# 02: SESSION TAGS
# This is the backbone of the block.
# In this PDT we tag all users by medium,
# source, campaign, and page referrer.
# A user once tagged, it won't change.
############################
view: session_tags{
  derived_table:{
    increment_key: "session_date"
    partition_keys: ["session_date"]
    cluster_keys: ["sl_key","session_date"]
    datagroup_trigger: ga4_main_datagroup
    sql:SELECT DISTINCT sl.sl_key, sl.session_date
  , CASE WHEN key = 'medium' THEN value.string_value END AS medium
  , CASE WHEN key = 'source' THEN value.string_value END AS source
  , CASE WHEN key = 'campaign' THEN value.string_value END AS campaign
  , CASE WHEN key = 'page_referrer' THEN value.string_value END AS page_referrer
FROM (
  SELECT sl_key, sl3.session_date, key, value,event_timestamp
  FROM ${session_list_with_event_history.SQL_TABLE_NAME} sl3
  CROSS JOIN UNNEST(sl3.event_params) AS sl1
  WHERE event_name in ('page_view')
    AND key IN ('medium','source','campaign','page_referrer')
    AND sl_key IS NOT NULL
) AS sl
JOIN (
  SELECT sl2.sl_key, sl2.session_date, MIN(event_timestamp) AS min_event_timestamp
  FROM ${session_list_with_event_history.SQL_TABLE_NAME} AS sl2
  GROUP BY sl2.sl_key, sl2.session_date
) AS min_events ON sl.sl_key = min_events.sl_key AND sl.session_date = min_events.session_date
WHERE sl.event_timestamp = min_events.min_event_timestamp
and {% incrementcondition %} sl.session_date {% endincrementcondition %};;
  }
  dimension: session_date {
    type: date
    hidden: yes
    sql: ${TABLE}.session_date ;;
  }
}
