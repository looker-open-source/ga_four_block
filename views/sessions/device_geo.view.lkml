include: "/views/sessions/*.view.lkml"
view: device_geo{
  derived_table:{
    datagroup_trigger: ga4_main_datagroup
    sql:select sl.sl_key
      ,  sl.device.category device__category
      ,  sl.device.mobile_brand_name device__mobile_brand_name
      ,  sl.device.mobile_model_name device__mobile_model_name
      ,  sl.device.mobile_brand_name||' '||device.mobile_model_name device__mobile_device_info
      ,  sl.device.mobile_marketing_name device__mobile_marketing_name
      ,  sl.device.mobile_os_hardware_model device__mobile_os_hardware_model
      ,  sl.device.operating_system device__operating_system
      ,  sl.device.operating_system_version device__operating_system_version
      ,  sl.device.vendor_id device__vendor_id
      ,  sl.device.advertising_id device__advertising_id
      ,  sl.device.language device__language
      ,  sl.device.time_zone_offset_seconds device__time_zone_offset_seconds
      ,  sl.device.is_limited_ad_tracking device__is_limited_ad_tracking
      ,  sl.device.web_info.browser device__web_info_browser
      ,  sl.device.web_info.browser_version device__web_info_browser_version
      --,  sl.device.web_info.hostname device__web_info_hostname
      ,  case when sl.device.category = 'mobile' then true else false end as device__is_mobile
      ,  sl.geo.continent geo__continent
      ,  sl.geo.country geo__country
      ,  sl.geo.city geo__city
      ,  sl.geo.metro geo__metro
      ,  sl.geo.sub_continent geo__sub_continent
      ,  sl.geo.region geo__region
        from ${session_list_with_event_history.SQL_TABLE_NAME} AS sl
    where sl.event_name = 'session_start' ;;
  }
}
