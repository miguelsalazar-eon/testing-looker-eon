view: reservation_linear_reg_eval {
  derived_table: {
    sql:
      SELECT
        *
      FROM ml.EVALUATE(
        MODEL ${model_bqml.SQL_TABLE_NAME},
        (SELECT
           *
         FROM ${input_data.SQL_TABLE_NAME}));;
  }
  dimension: mean_absolute_error {type: number}
  dimension: mean_squared_error {type: number}
  dimension: mean_squared_log_error {type: number}
  dimension: median_absolute_error {type: number}
  dimension: r2_score {type: number}
  dimension: explained_variance {type: number}
}
