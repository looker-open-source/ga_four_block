include: "/views/event_data_dimensions/event_funnel.view"
include: "/views/event_data_dimensions/page_funnel.view"
include: "/views/sessions/*.view"
include: "/views/bqml/*/*.view"

view: sessions {
  derived_table: {
    datagroup_trigger: ga4_main_datagroup
    partition_keys: ["session_date"]
    cluster_keys: ["session_date"]
    increment_key: "session_date"
    increment_offset: 3
    sql:
-- Final Select Statement:
select se.session_date as session_date
    ,  se.ga_session_id as ga_session_id
    ,  se.ga_session_number as ga_session_number
    ,  se.user_pseudo_id as user_pseudo_id
    ,  se.sl_key
    -- packing session-level data into structs by category
    ,  (SELECT AS STRUCT coalesce(sa.medium,'(none)') medium -- sessions missing last-non-direct are direct
                      ,  coalesce(sa.source,'(direct)') source
                      ,  coalesce(sa.campaign,'(direct)') campaign
                      ,  sa.page_referrer) session_attribution
    ,  (SELECT AS STRUCT sf.session_event_count
                      ,  sf.engaged_events
                      ,  sf.session_page_view_count
                      ,  sf.is_engaged_session
                      ,  sf.is_first_visit_session
                      ,  sf.session_end
                      ,  sf.session_start
                      ,  sf.session_length_minutes) session_data
    ,  (SELECT AS STRUCT d.device__category
                      ,  d.device__mobile_brand_name
                      ,  d.device__mobile_model_name
                      ,  d.device__mobile_device_info
                      ,  d.device__mobile_marketing_name
                      ,  d.device__mobile_os_hardware_model
                      ,  d.device__operating_system
                      ,  d.device__operating_system_version
                      ,  d.device__vendor_id
                      ,  d.device__advertising_id
                      ,  d.device__language
                      ,  d.device__time_zone_offset_seconds
                      ,  d.device__is_limited_ad_tracking
                      ,  d.device__web_info_browser
                      ,  d.device__web_info_browser_version
                      --,  d.device__web_info_hostname
                      ,  d.device__is_mobile) device_data
    ,  (SELECT AS STRUCT d.geo__continent
                      ,  d.geo__country
                      ,  d.geo__city
                      ,  d.geo__metro
                      ,  d.geo__sub_continent
                      ,  d.geo__region) geo_data
    ,se.event_data
from ${session_event_packing.SQL_TABLE_NAME} as se
left join ${session_tags.SQL_TABLE_NAME} as sa
  on  se.sl_key = sa.sl_key
left join ${session_facts.SQL_TABLE_NAME} as sf
  on  se.sl_key = sf.sl_key
left join ${device_geo.SQL_TABLE_NAME} as d
  on  se.sl_key = d.sl_key
where {% incrementcondition %} se.session_date {%  endincrementcondition %};;
  }

extends: [event_funnel, page_funnel]

## Parameters

  parameter: audience_selector {
    view_label: "Audience"
    description: "Use to set 'Audience Trait' field to dynamically choose a user cohort."
    type: string
    allowed_value: { value: "Device" }
    allowed_value: { value: "Operating System" }
    allowed_value: { value: "Browser" }
    allowed_value: { value: "Country" }
    allowed_value: { value: "Continent" }
    allowed_value: { value: "Metro" }
    allowed_value: { value: "Language" }
    allowed_value: { value: "Channel" }
    allowed_value: { value: "Medium" }
    allowed_value: { value: "Source" }
    allowed_value: { value: "Source Medium" }
    default_value: "Source"
  }

## Dimensions
  dimension: sl_key {
    type: string
    sql: ${TABLE}.sl_key ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: session {
    type: time
    sql: ${TABLE}.session_date ;;
  }

  dimension: ga_session_id {
    type: number
    sql: ${TABLE}.ga_session_id ;;
  }

  dimension: ga_session_number {
    view_label: "Audience"
    group_label: "User"
    label: "Session Number"
    type: number
    sql: ${TABLE}.ga_session_number ;;
  }

  dimension: ga_session_number_tier {
    view_label: "Audience"
    group_label: "User"
    label: "Session Number Tier"
    description: "Session Number dimension grouped in tiers between 1-100. See 'Session Number' for full description."
    type: tier
    tiers: [1,2,5,10,15,20,50,100]
    style: integer
    sql: ${ga_session_number} ;;
  }

  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }

  dimension: event_data {
    hidden: yes
    type: string
    sql:${TABLE}.event_data;;
    ## This is the parent array that contains the event_data struct elements. It is not directly useably as a dimension.
    ## It is necessary for proper unnesting in the model Join.
  }

  dimension: audience_trait {
    view_label: "Audience"
    group_label: "Audience Cohorts"
    description: "Dynamic cohort field based on value set in 'Audience Selector' filter."
    type: string
    sql: CASE
              WHEN {% parameter audience_selector %} = 'Channel' THEN ${attribution_sources.attribution_source_channel}
              WHEN {% parameter audience_selector %} = 'Medium' THEN ${session_attribution_medium}
              WHEN {% parameter audience_selector %} = 'Source' THEN ${session_attribution_source}
              WHEN {% parameter audience_selector %} = 'Source Medium' THEN ${session_attribution_source_medium}
              WHEN {% parameter audience_selector %} = 'Device' THEN ${device_data_device_category}
              WHEN {% parameter audience_selector %} = 'Browser' THEN ${device_data_web_info_browser}
              WHEN {% parameter audience_selector %} = 'Metro' THEN ${geo_data_metro}
              WHEN {% parameter audience_selector %} = 'Country' THEN ${geo_data_country}
              WHEN {% parameter audience_selector %} = 'Continent' THEN ${geo_data_continent}
              WHEN {% parameter audience_selector %} = 'Language' THEN ${device_data_language}
              WHEN {% parameter audience_selector %} = 'Operating System' THEN ${device_data_operating_system}
        END;;
  }

  ## Entrance(Landing)/Exit

  dimension: landing_page {
    view_label: "Behavior"
    group_label: "Pages"
    description: "Landing/Entrance Page (first 'Page View' event) of a Session."
    sql: (select coalesce(regexp_extract((select value.string_value from UNNEST(event_params) where key = "page_location"),r"(?:.*?[\.][^\/]*)([\/][^\?]+)"),'/')
          from sessions.event_data as event_history
          where event_history.sl_key = (sessions.sl_key) and event_history.page_view_rank = 1 limit 1) ;;
  }
  dimension: exit_page {
    view_label: "Behavior"
    group_label: "Pages"
    description: "Exit Page (last 'Page View' event) of a Session."

    sql: (select coalesce(regexp_extract((select value.string_value from UNNEST(event_params) where key = "page_location"),r"(?:.*?[\.][^\/]*)([\/][^\?]+)"),'/')
          from sessions.event_data as event_history
          where event_history.sl_key = (sessions.sl_key) and event_history.page_view_reverse_rank = 1 limit 1) ;;
  }

  ## Session Data Dimensions
  dimension: session_data {
    type: string
    sql: ${TABLE}.session_data ;;
    hidden: yes
    ## This is the Parent Struct that contains the session_data elements. It is not directly useably as a dimension.
    ## It is referred to by its child dimensions in their sql definition.
  }
    dimension: session_data_session_event_count {
      type: number
      sql:${session_data}.session_event_count;;
      label: "Session Event Count"
    }
    dimension: session_data_engaged_events {
      type: number
      sql: ${session_data}.engaged_events ;;
      label: "Session Engaged Event Count"
    }
    dimension: session_data_page_view_count {
      type: number
      sql: ${session_data}.session_page_view_count ;;
      label: "Page View Count"
    }
    dimension: session_data_is_engaged_session {
      type: yesno
      sql: ${session_data}.is_engaged_session ;;
      label: "Is Engaged Session?"
    }
    dimension: session_data_is_first_visit_session {
      type: yesno
      sql: ${session_data}.is_first_visit_session ;;
      label: "Is First Visit Session?"
    }
    dimension_group: session_data_session_end {
      type: time
      sql: ${session_data}.session_end ;;
      timeframes: [raw,time,hour,hour_of_day,date,day_of_week,day_of_week_index,week,month,year]
      label: "Session End"
    }
    dimension_group: session_data_session_start {
      type: time
      sql: ${session_data}.session_start ;;
      timeframes: [raw,time,hour,hour_of_day,date,day_of_week,day_of_week_index,week,month,year]
      label: "Session Start"
    }
    dimension: session_data_session_duration {
      type: number
      sql: ((TIMESTAMP_DIFF(${session_data_session_end_raw}, ${session_data_session_start_raw}, second))/86400.0)  ;;
      value_format_name: hour_format
      label: "Session Duration"
    }
    dimension: session_data_session_duration_tier {
      label: "Session Duration Tiers"
      description: "The length (returned as a string) of a session measured in seconds and reported in second increments."
      type: tier
      sql: (${session_data_session_duration}*86400.0) ;;
      tiers: [10,30,60,120,180,240,300,600]
      style: integer
    }
    dimension: session_data_is_bounce {
      type: yesno
      sql: ${session_data_session_duration} = 0 ;;
      label: "Is Bounce?"
      description: "If Session Duration Minutes = 0 and there are no engaged events in the Session, then Bounce = True."
    }

  ## Session Attribution Dimensions
  dimension: session_attribution {
    type: string
    sql: ${TABLE}.session_attribution ;;
    hidden: yes
    ## This is the Parent Struct that contains the session_attribution elements. It is not directly useably as a dimension.
    ## It is referred to by its child dimensions in their sql definition.
  }
    dimension: session_attribution_page_referrer {
      # group_label: "Attribution"
      # label: "Page Referrer"
      view_label: "Acquisition"
      group_label: "Session Traffic Source"
      label: "Full Referrer"
      description: "The full referring URL including the hostname and path."
      type: string
      sql: ${session_attribution}.page_referrer ;;
    }
    dimension: session_attribution_campaign {
      view_label: "Acquisition"
      group_label: "Advertising"
      label: "Campaign"
      description: "The campaign value. Usually set by the utm_campaign URL parameter."
      type: string
      sql: ${session_attribution}.campaign ;;
    }
    dimension: session_attribution_source {
      view_label: "Acquisition"
      group_label: "Session Traffic Source"
      label: "Source"
      type: string
      sql: ${session_attribution}.source ;;
    }
    dimension: session_attribution_medium {
      view_label: "Acquisition"
      group_label: "Session Traffic Source"
      label: "Medium"
      type: string
      sql: ${session_attribution}.medium ;;
    }
    dimension: session_attribution_source_medium {
      view_label: "Acquisition"
      group_label: "Session Traffic Source"
      label: "Source Medium"
      type: string
      sql: ${session_attribution}.source||' '||${session_attribution}.medium ;;
    }

  ## Session Device Data Dimensions
  dimension: device_data {
    type: string
    sql: ${TABLE}.device_data ;;
    hidden: yes
    ## This is the Parent Struct that contains the device_data elements. It is not directly useably as a dimension.
    ## It is referred to by its child dimensions in their sql definition.
  }
    dimension: device_data_device_category {
      view_label: "Audience"
      group_label: "Mobile"
      label: "Device Category"
      type: string
      sql: ${device_data}.device__category ;;
    }
    dimension: device_data_mobile_brand_name {
      view_label: "Audience"
      group_label: "Mobile"
      label: "Mobile Device Branding"
      type: string
      sql: ${device_data}.device__mobile_brand_name ;;
    }
    dimension: device_data_mobile_model_name {
      view_label: "Audience"
      group_label: "Mobile"
      label: "Mobile Device Model"
      type: string
      sql: ${device_data}.device__mobile_model_name ;;
    }
    dimension: device_data_mobile_device_info {
      view_label: "Audience"
      group_label: "Mobile"
      label: "Mobile Device Info"
      type: string
      sql: ${device_data}.device__mobile_device_info ;;
    }
    dimension: device_data_mobile_marketing_name {
      view_label: "Audience"
      group_label: "Mobile"
      label: "Mobile Device Marketing Name"
      type: string
      sql: ${device_data}.device__mobile_marketing_name ;;
    }
    dimension: device_data_mobile_os_hardware_model {
      view_label: "Audience"
      group_label: "Mobile"
      label: "Mobile OS Hardware Model"
      type: string
      sql: ${device_data}.device__mobile_os_hardware_model ;;
    }
    dimension: device_data_operating_system {
      view_label: "Audience"
      group_label: "Technology"
      label: "Operating System"
      type: string
      sql: ${device_data}.device__operating_system ;;
    }
    dimension: device_data_operating_system_version {
      view_label: "Audience"
      group_label: "Technology"
      label: "Operating System Version"
      type: string
      sql: ${device_data}.device__operating_system_version ;;
    }
    dimension: device_data_vendor_id {
      hidden: yes
      group_label: "Device"
      label: "Vendor ID"
      type: string
      sql: ${device_data}.device__vendor_id ;;
    }
    dimension: device_data_advertising_id {
      hidden: yes
      group_label: "Device"
      label: "Advertising ID"
      type: string
      sql: ${device_data}.device__advertising_id ;;
    }
    dimension: device_data_language {
      view_label: "Audience"
      group_label: "User"
      label: "Language"
      type: string
      sql: ${device_data}.device__language ;;
    }
    dimension: device_data_time_zone_offset_seconds {
      group_label: "Device"
      label: "Time Zone Offset Seconds"
      type: number
      sql: ${device_data}.device__time_zone_offset_seconds ;;
    }
    dimension: device_data_is_limited_ad_tracking {
      group_label: "Device"
      label: "Is Limited Ad Tracking?"
      type: string
      sql: ${device_data}.device__is_limited_ad_tracking ;;
    }
    dimension: device_data_web_info_browser {
      view_label: "Audience"
      group_label: "Technology"
      label: "Browser"
      type: string
      sql: ${device_data}.device__web_info_browser ;;
    }
    dimension: device_data_web_info_browser_version {
      view_label: "Audience"
      group_label: "Technology"
      label: "Browser Version"
      type: string
      sql: ${device_data}.device__web_info_browser_version ;;
    }
    #dimension: device_data_web_info_hostname {
      #group_label: "Device"
     # view_label: "Behavior"
      #group_label: "Pages"
      #label: "Hostname"
      #description: "The hostname from which the tracking request was made."
      #type: string
      #sql: ${device_data}.device__web_info_hostname ;;
    #}
    dimension: device_is_mobile {
      group_label: "Device"
      label: "Is Mobile?"
      type: string
      sql: ${device_data}.device__is_mobile ;;
      description: "Is the user's device a mobile device? (Yes/No)"
    }

  ## Session Geo Data Dimensions
  dimension: geo_data {
    type: string
    sql: ${TABLE}.geo_data ;;
    hidden: yes
    ## This is the Parent Struct that contains the geo_data elements. It is not directly useably as a dimension.
    ## It is referred to by its child dimensions in their sql definition.
  }
    dimension: geo_data_continent {
      view_label: "Audience"
      group_label: "Geo"
      label: "Continent"
      type: string
      sql: ${geo_data}.geo__continent ;;
    }
    dimension: geo_data_country {
      view_label: "Audience"
      group_label: "Geo"
      label: "Country"
      type: string
      sql: ${geo_data}.geo__country ;;
      map_layer_name: countries
    }
    dimension: geo_data_city {
      view_label: "Audience"
      group_label: "Geo"
      label: "City"
      type: string
      sql: ${geo_data}.geo__city ;;
    }
    dimension: geo_data_metro {
      view_label: "Audience"
      group_label: "Geo"
      label: "Metro"
      type: string
      sql: ${geo_data}.geo__metro ;;
    }
    dimension: geo_data_sub_continent {
      view_label: "Audience"
      group_label: "Geo"
      label: "Sub-Continent"
      type: string
      sql: ${geo_data}.geo__sub_continent ;;
    }
    dimension: geo_data_region {
      view_label: "Audience"
      group_label: "Geo"
      label: "Region"
      type: string
      sql: ${geo_data}.geo__region ;;
      map_layer_name: us_states
    }

## Measures

  measure: total_sessions {
    group_label: "Session"
    label: "Sessions"
    description: "Total Number of Sessions (Count)"
    type: count_distinct
    sql: ${sl_key} ;;
    value_format_name: formatted_number
    drill_fields: [session_attribution_source_medium,total_sessions,total_new_users,events.total_page_views,average_session_duration]
  }

  measure: total_first_visit_sessions {
    group_label: "Session"
    label: "New Sessions"
    description: "Total Number of 'First Visit' Sessions (Count)"
    type: count_distinct
    sql: ${sl_key} ;;
    filters: [session_data_is_first_visit_session: "yes"]
    value_format_name: formatted_number
  }

  measure: total_first_visit_sessions_percentage {
    group_label: "Session"
    label: "New Sessions %"
    description: "Percentage of New Sessions out of All Sessions"
    type: number
    sql: ${total_first_visit_sessions}/nullif(${total_sessions},0) ;;
    value_format_name: percent_2
  }

  measure: total_engaged_sessions {
    group_label: "Session"
    label: "Engaged Sessions"
    description: "Total Number of Sessions w/ Engaged Event"
    type: count_distinct
    sql: ${sl_key} ;;
    filters: [session_data_is_engaged_session: "yes"]
    value_format_name: formatted_number
  }

  measure: total_engaged_sessions_percentage {
    group_label: "Session"
    label: "Engaged Sessions %"
    type: number
    sql: ${total_engaged_sessions}/nullif(${total_sessions},0) ;;
    value_format_name: percent_2
  }

  measure: average_page_views_per_session {
    group_label: "Session"
    label: "Avg. Page Views per Session"
    description: "Average Count of 'Page_View' events within each Session."
    type: average
    sql: ${session_data_page_view_count} ;;
    value_format_name: decimal_2
  }

  measure: total_bounced_sessions {
    group_label: "Session"
    label: "Bounces"
    description: "Total Number of Sessions with 0 Duration w/out Engagement"
    type: count_distinct
    sql: ${sl_key} ;;
    filters: [session_data_is_bounce: "yes"]
    value_format_name: formatted_number
  }

  measure: total_bounced_sessions_percentage {
    group_label: "Session"
    label: "Bounce Rate"
    description: "Percentage of Bounce Sessions out of All Sessions"
    type: number
    sql: ${total_bounced_sessions}/nullif(${total_sessions},0) ;;
    value_format_name: percent_2
  }

  measure: average_session_duration {
    group_label: "Session"
    label: "Avg. Session Duration"
    description: "The Average Session Duration in HH:MM:SS Format"
    type: average
    sql: ${session_data_session_duration} ;;
    value_format_name: hour_format
  }

  measure: total_users {
    view_label: "Audience"
    group_label: "User"
    label: "Users"
    description: "Distinct/Unique count of Users"
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    value_format_name: formatted_number
  }
  #measure: total_event_count {
  #  type: sum
  #  description: "Total times an event occured on a specific date"
  #  sql: ${session_data_session_event_count} ;;
  #  value_format_name: formatted_number
  #}

  measure: total_new_users {
    view_label: "Audience"
    group_label: "User"
    label: "New Users"
    description: "Distinct/Unique count of User Pseudo ID where GA Session Number = 1"
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [session_data_is_first_visit_session: "yes"]
    value_format_name: formatted_number
  }

  measure: total_returning_users {
    view_label: "Audience"
    group_label: "User"
    label: "Returning Users"
    description: "Distinct/Unique count of User Pseudo ID where GA Session Number > 1"
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [session_data_is_first_visit_session: "no"]
    value_format_name: formatted_number
  }

  measure: percentage_new_users {
    view_label: "Audience"
    group_label: "User"
    label: "% New Users"
    type: number
    sql: ${total_new_users}/nullif(${total_users},0) ;;
    value_format_name: percent_2
  }

  measure: percentage_returning_users {
    view_label: "Audience"
    group_label: "User"
    label: "% Returning Users"
    type: number
    sql: ${total_returning_users}/nullif(${total_users},0) ;;
    value_format_name: percent_2
  }

}
