include: "/views/sessions/*.view.lkml"
###########################
# 04: SESSION EVENT PACKING
# In this query we get all of the items that
# were nested and aggregate them into one. This is then used in the events table.
#
############################
view: session_event_packing {
  derived_table:{
    datagroup_trigger: ga4_main_datagroup
    partition_keys: ["session_date"]
    cluster_keys: ["sl_key","user_pseudo_id","session_date"]
    increment_key: "session_date"
    increment_offset: 0
    sql:SELECT sl.session_date session_date
          , sl.ga_session_id ga_session_id
          , sl.ga_session_number ga_session_number
          , sl.user_pseudo_id user_pseudo_id
          , sl.sl_key
          , ARRAY_AGG(STRUCT(sl_key,
                          event_rank,
                          page_view_rank,
                          page_view_reverse_rank,
                          time_to_next_event,
                          time_to_next_page,
                          event_date,
                          event_timestamp,
                          event_name,
                          event_params,
                          event_previous_timestamp,
                          event_value_in_usd,
                          event_bundle_sequence_id,
                          event_server_timestamp_offset,
                          user_id,
                          user_properties,
                          user_first_touch_timestamp,
                          user_ltv,
                          device,
                          geo,
                          app_info,
                          traffic_source,
                          stream_id,
                          platform,
                          event_dimensions,
                          ecommerce,
                          items
          )) event_data
FROM ${session_list_with_event_history.SQL_TABLE_NAME} AS sl
WHERE sl.sl_key IN (SELECT sl_key FROM ${session_facts.SQL_TABLE_NAME}
  WHERE CASE WHEN "@{EVENT_COUNT}" = "" THEN 1=1 WHEN "@{EVENT_COUNT}" != "" THEN
    session_event_count< SAFE_CAST("@{EVENT_COUNT}" AS INT64) END) AND event_name IS NOT NULL
AND {% incrementcondition %} session_date {% endincrementcondition %}
GROUP BY 1,2,3,4,5;;
  }
  dimension: session_date{
    type: date
    hidden: yes
  }
}
