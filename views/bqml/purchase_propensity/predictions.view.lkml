######################## TRAINING/TESTING INPUTS #############################
include: "/views/bqml/purchase_propensity/*.view"
include: "/views/sessions/*.view"

######################## MODEL #############################

view: future_purchase_model {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(
        MODEL_TYPE = 'BOOSTED_TREE_CLASSIFIER',
        BOOSTER_TYPE = 'GBTREE',
        MAX_ITERATIONS = 100,
        --LEARN_RATE = 0.1,
        COLSAMPLE_BYLEVEL = 0.85,
        COLSAMPLE_BYTREE = 0.85,
        COLSAMPLE_BYNODE = 0.85,
        SUBSAMPLE = 0.85,
        --NUM_PARALLEL_TREE = 10,
        DATA_SPLIT_METHOD = 'AUTO_SPLIT',
        EARLY_STOP = FALSE,
        ENABLE_GLOBAL_EXPLAIN = TRUE,
        APPROX_GLOBAL_FEATURE_CONTRIB = TRUE,
        INPUT_LABEL_COLS = ['will_purchase_in_future']
      ) AS
      SELECT
        * EXCEPT(user_pseudo_id)
      FROM ${training_input.SQL_TABLE_NAME};;
  }
}

######################## TRAINING INFORMATION #############################
explore:  future_purchase_model_evaluation {hidden:yes}
explore: future_purchase_model_training_info {hidden:yes}
explore: roc_curve {hidden:yes}
explore: confusion_matrix {hidden:yes}
explore: feature_importance {hidden:yes}

# VIEWS:
view: future_purchase_model_evaluation {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql:
          SELECT * FROM ml.EVALUATE(
          MODEL ${future_purchase_model.SQL_TABLE_NAME},
          (SELECT * FROM ${testing_input.SQL_TABLE_NAME}))
;;
  }
  dimension: recall {type: number value_format_name:percent_2}
  dimension: accuracy {type: number value_format_name:percent_2}
  dimension: f1_score {type: number value_format_name:percent_3}
  dimension: log_loss {type: number}
  dimension: roc_auc {type: number}
}

view: roc_curve {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql:
    SELECT * FROM ml.ROC_CURVE(
        MODEL ${future_purchase_model.SQL_TABLE_NAME},
        (SELECT * FROM ${testing_input.SQL_TABLE_NAME}));;
  }
  dimension: threshold {
    type: number
    link: {
      label: "Likely Customers to Purchase"
      url: "/explore/bqml_ga_demo/ga_sessions?fields=ga_sessions.fullVisitorId,future_purchase_prediction.max_predicted_score&f[future_purchase_prediction.predicted_will_purchase_in_future]=%3E%3D{{value}}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }
  dimension: recall {type: number value_format_name: percent_2}
  dimension: false_positive_rate {type: number}
  dimension: true_positives {type: number }
  dimension: false_positives {type: number}
  dimension: true_negatives {type: number}
  dimension: false_negatives {type: number }
  dimension: precision {
    type:  number
    value_format_name: percent_2
    sql:  ${true_positives} / NULLIF((${true_positives} + ${false_positives}),0);;
  }
  measure: total_false_positives {
    type: sum
    sql: ${false_positives} ;;
  }
  measure: total_true_positives {
    type: sum
    sql: ${true_positives} ;;
  }
  dimension: threshold_accuracy {
    type: number
    value_format_name: percent_2
    sql:  1.0*(${true_positives} + ${true_negatives}) / NULLIF((${true_positives} + ${true_negatives} + ${false_positives} + ${false_negatives}),0);;
  }
  dimension: threshold_f1 {
    type: number
    value_format_name: percent_3
    sql: 2.0*${recall}*${precision} / NULLIF((${recall}+${precision}),0);;
  }
}

view: confusion_matrix {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql:
    SELECT Expected_label,_0 as Predicted_0,_1 as Predicted_1  FROM ml.confusion_matrix(
        MODEL ${future_purchase_model.SQL_TABLE_NAME},
        (SELECT * FROM ${testing_input.SQL_TABLE_NAME}));;
  }
  dimension: Expected_label {type:string}
  dimension: Predicted_0 {type: number}
  dimension: Predicted_1 {type: number}
}

view: future_purchase_model_training_info {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql:
    SELECT  * FROM ml.TRAINING_INFO(MODEL ${future_purchase_model.SQL_TABLE_NAME});;
  }
  dimension: training_run {type: number}
  dimension: iteration {type: number}
  dimension: loss_raw {sql: ${TABLE}.loss;; type: number hidden:yes}
  dimension: eval_loss {type: number}
  dimension: duration_ms {label:"Duration (ms)" type: number}
  dimension: learning_rate {type: number}
  measure: total_iterations {
    type: count
  }
  measure: loss {
    value_format_name: decimal_2
    type: sum
    sql:  ${loss_raw} ;;
  }
  measure: total_training_time {
    type: sum
    label:"Total Training Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  measure: average_iteration_time {
    type: average
    label:"Average Iteration Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
}

view: feature_importance {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql:
    SELECT
      *
    FROM
      ML.GLOBAL_EXPLAIN(MODEL ${future_purchase_model.SQL_TABLE_NAME});;
  }
  dimension: feature {type:string}
  dimension: attribution {type: number value_format_name: decimal_2}
}

########################################## PREDICT FUTURE ############################
explore:  future_purchase_prediction {hidden:yes}
view: future_purchase_prediction {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql:
    select
          pred.*,
          predicted_will_purchase_in_future_probs_unnest.prob as pred_probability from
          (SELECT * FROM ml.PREDICT(
          MODEL ${future_purchase_model.SQL_TABLE_NAME},
          (SELECT * FROM ${future_input.SQL_TABLE_NAME}))) pred
          left join unnest(pred.predicted_will_purchase_in_future_probs) as predicted_will_purchase_in_future_probs_unnest
          where predicted_will_purchase_in_future_probs_unnest.label=1
          ;;
  }
  dimension: predicted_will_purchase_in_future {type: number}
  # dimension: sl_key {type: number hidden:yes}
  # dimension: user_pseudo_id {type: number hidden: yes}
  dimension: user_pseudo_id {type: number primary_key: yes}
  # dimension: prob {type: number hidden: yes}

  dimension: pred_probability {
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.pred_probability ;;
    drill_fields: [user_pseudo_id]
  }
  dimension: pred_prob_perc {
    type: number
    sql:APPROX_QUANTILES(${TABLE}.pred_probability,100);;
  }
  dimension: pred_prob_perc_10 {
    type: number
    hidden: yes
    sql: ${pred_prob_perc}[OFFSET(10)] ;;
  }
  dimension: pred_prob_perc_20 {
    type: number
    hidden: yes
    sql: ${pred_prob_perc}[OFFSET(20)] ;;
  }
  dimension: pred_prob_perc_30 {
    type: number
    hidden: yes
    sql: ${pred_prob_perc}[OFFSET(30)];;
  }
  dimension: pred_prob_perc_40 {
    type: number
    hidden: yes
    sql:${pred_prob_perc}[OFFSET(40)];;
  }
  dimension: pred_prob_perc_50 {
    type: number
    hidden: yes
    sql: ${pred_prob_perc}[OFFSET(50)] ;;
  }
  dimension: pred_prob_perc_60 {
    type: number
    hidden: yes
    sql:${pred_prob_perc}[OFFSET(60)] ;;
  }
  dimension: pred_prob_perc_70 {
    type: number
    hidden: yes
    sql: ${pred_prob_perc}[OFFSET(70)] ;;
  }
  dimension: pred_prob_perc_80 {
    type: number
    hidden: yes
    sql: ${pred_prob_perc}[OFFSET(80)];;
  }
  dimension: pred_prob_perc_90 {
    type: number
    hidden: yes
    sql: ${pred_prob_perc}[OFFSET(90)] ;;
  }

  dimension: pred_probability_bucket {
    type: tier
    tiers: [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9]
    style: relational
    sql: ${pred_probability} ;;
    drill_fields: [user_pseudo_id]
  }
  measure: count {
    label:"Person Count"
    type: count
  }
}
