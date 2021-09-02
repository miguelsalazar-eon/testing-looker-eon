view: model_arima_evaluate {
  derived_table: {
    sql:
      SELECT
        *
      FROM ML.ARIMA_EVALUATE(MODEL ${model_bqml_arima.SQL_TABLE_NAME});;
  }
  dimension: log_likelihood {type: number}
  dimension: AIC {type: number}
  dimension: variance {type: number}
  dimension: non_seasonal_p {type: number}
  dimension: non_seasonal_d {type: number}
  dimension: non_seasonal_q {type: number}
}
