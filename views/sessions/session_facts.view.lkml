include: "/views/sessions/*.view.lkml"
###########################
# 03: SESSION FACTS
# This PDT gets basic facts for the session like when it started,
# how many pages it viewed, and the length in minutes.
# Primary Key is always sl_key
############################
view: session_facts{
  derived_table: {
    datagroup_trigger: ga4_main_datagroup
    sql: select sl.sl_key as sl_key
      ,  COUNT(sl.event_timestamp) session_event_count
      ,  SUM(case when sl.event_name = 'page_view' then 1 else 0 end) session_page_view_count
      ,  COALESCE(SUM((select value.int_value from UNNEST(sl.event_params) where key = "engaged_session_event")),0) engaged_events
      ,  case when (COALESCE(SUM((select value.int_value from UNNEST(sl.event_params) where key = "engaged_session_event")),0) = 0
               and COALESCE(SUM((select coalesce(SAFE_CAST(value.string_value as INT64),value.int_value) from UNNEST(sl.event_params) where key = "session_engaged"))) = 0)
              then false else true end as is_engaged_session
            , case when countif(event_name = 'first_visit') = 0 then false else true end as is_first_visit_session
            , MAX(TIMESTAMP_MICROS(sl.event_timestamp)) as session_end
            , MIN(TIMESTAMP_MICROS(sl.event_timestamp)) as session_start
            , (MAX(sl.event_timestamp) - MIN(sl.event_timestamp))/(60 * 1000 * 1000) AS session_length_minutes
              from ${session_list_with_event_history.SQL_TABLE_NAME} AS sl
  group by 1;;
  }
}
