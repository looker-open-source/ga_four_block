datagroup: bqml_datagroup {
  # Retrain model every week when BQML_PARAMETER is 'Yes'.
  # If 'No', return constant 'disabled' so Looker never triggers PDT rebuilds.
  sql_trigger: SELECT CASE WHEN "@{BQML_PARAMETER}" = 'Yes' THEN CAST(EXTRACT(week FROM CURRENT_DATE()) AS STRING) ELSE 'disabled' END ;;
}

datagroup: attribution_channel {
  # re builds dummy tables for channel acquisition
  sql_trigger: SELECT EXTRACT(month FROM CURRENT_DATE()) ;;
}
