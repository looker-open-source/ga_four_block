project_name: "ga_four"

## Connection Constants:
constant: GA4_CONNECTION {
  value: "bq-looker-marketplace-ga4"
  export: override_required
}

constant: GA4_SCHEMA {
  value: "ga4_export"
  export: override_optional
}

constant: GA4_TABLE_VARIABLE {
  value: "events_*"
  export: override_optional
}
constant: EVENT_COUNT {
  value: ""
  export: override_optional
}
constant: model_step_prediction {
  value: "60"
  #export: override_optional
}
constant: BQML_PARAMETER {
  value: "Yes"
  export: override_optional
}

constant: GA4_BQML_train_months {
  value: "12"
  # export: override_optional
}

constant: GA4_BQML_test_months {
  value: "3"
  # export: override_optional
}

constant: GA4_BQML_future_synth_months {
  value: "12"
  # export: override_optional
}
