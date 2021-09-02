view: model_explain_forecast_arima {
  derived_table: {
    sql:
      SELECT
       *
      FROM
       ML.EXPLAIN_FORECAST(MODEL ${model_bqml_arima.SQL_TABLE_NAME},
                           STRUCT(30 AS horizon, 0.8 AS confidence_level))
      ;;
  }
  # SQL consultando el modelo directo sin crear el input ni create solo remplazalo
  # en la parte de arriba.
  #SELECT
  #    *
  #   FROM
  #   ML.EXPLAIN_FORECAST(MODEL `EON_raw.reservations-top1-34022-arima_model`,
  #                       STRUCT(30 AS horizon, 0.8 AS confidence_level)


  dimension: time_series_data {type: number}
  dimension: prediction_interval_lower_bound {type: number}
  dimension: prediction_interval_upper_bound {type: number}
  dimension: time_series_timestamp {type:date}

  measure: lower_bound {
    type: sum
    sql: ${prediction_interval_lower_bound} ;;
  }
  measure: upper_bound {
    type: sum
    sql: ${prediction_interval_upper_bound} ;;
  }
  measure: series_data {
    type: sum
    sql: ${time_series_data} ;;
  }
}
