include: "/views/sessions/*.view.lkml"
include: "/views/*/*.view.lkml"
view: training_data_avbb {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql:
    SELECT sessions.sl_key,
    session_attribution.source,
    session_attribution.medium,
    session_attribution.campaign,
    device_data.device__category as device,
    events.event_name  AS events_event_name,
    device_data.device__is_limited_ad_tracking as lim_ad_track,
    SUM(TIMESTAMP_DIFF(session_data.session_end,session_data.session_start,second)/86400.0) as session_duration,
    SUM(session_data.session_page_view_count) as session_count,
    COALESCE(SUM(event_data[SAFE_OFFSET(0)].user_ltv.revenue),0.0) as label
    FROM ${sessions.SQL_TABLE_NAME}  as sessions
    LEFT JOIN UNNEST(sessions.event_data) as events with offset as event_row GROUP BY 1,2,3,4,5,6,7;;
  }
  dimension: sl_key {
    hidden: yes
    type: string
    sql: ${TABLE}.sl_key ;;
  }
}


view: avbb_model {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql_create: CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
OPTIONS
  ( MODEL_TYPE='LINEAR_REG',
    CALCULATE_P_VALUES=TRUE,
    MAX_ITERATIONS=5,
    CATEGORY_ENCODING_METHOD='DUMMY_ENCODING',
    ENABLE_GLOBAL_EXPLAIN=TRUE,
    DATA_SPLIT_METHOD='AUTO_SPLIT') AS
    SELECT source,
            medium,
            campaign,
            device,
            events_event_name,
            LN(session_duration) as session_duration,
            session_count,
            lim_ad_track,
            LN(label) as label from ${training_data_avbb.SQL_TABLE_NAME}   WHERE label>0 AND session_duration>0
    ;;
  }
}

view: model_explanation {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql: SELECT * FROM
    ML.GLOBAL_EXPLAIN(MODEL ${avbb_model.SQL_TABLE_NAME}) ;;
  }
  dimension: feature {
    type: string
    sql: ${TABLE}.feature ;;
  }
  dimension: attribution {
    type: number
    sql: ${TABLE}.attribution ;;
  }
}

explore: model_explanation {
  hidden: yes
}

view: category_attribution {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql: SELECT * FROM ML.ADVANCED_WEIGHTS(
  MODEL ${avbb_model.SQL_TABLE_NAME},
  STRUCT(TRUE AS standardize))
  WHERE p_value<0.05 ;;
  }

  dimension: processed_input {
    type: string
    sql: ${TABLE}.processed_input;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }
  dimension: standard_error {
    type: number
    sql: ${TABLE}.standard_error ;;
  }
  dimension: p_value {
    type: number
    sql: ${TABLE}.p_value ;;
  }

}
explore: category_attribution {
  hidden: yes
}

view: evaluation {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql: SELECT * FROM  ML.EVALUATE(MODEL ${avbb_model.SQL_TABLE_NAME});;
  }
  dimension: MAE {
    type: number
    sql: ${TABLE}.mean_absolute_error ;;
  }
  dimension: MSLE {
    type: number
    sql: ${TABLE}.mean_squared_log_error ;;
  }
  dimension: r_squared {
    type: number
    sql: ${TABLE}.r2_score ;;
  }
}
explore: evaluation {
  hidden: yes
}
