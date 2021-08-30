view: reservation_linear_reg_training {
  derived_table: {
    sql:
       SELECT
         *
       FROM ml.TRAINING_INFO(
            MODEL ${model_bqml.SQL_TABLE_NAME});;
  }
  dimension: training_run {type: number}
  dimension: iteration {type: number}
  dimension: loss {type: number}
  dimension: eval_loss {type: number}
  dimension: duration_s {
    label: "Duration (s)"
    type: number
    sql: ${TABLE}.duration_ms / 1000.00;;}
  dimension: learning_rate {type: number}
  measure: total_loss {
    type: sum
    sql: ${loss} ;;
  }
  measure: total_duration {
    type: sum
    sql: ${duration_s} ;;
  }
  measure: total_iterations {
    sql: max(${iteration}) ;;
  }
  measure: average_learning_rate {
    type: average
    sql: ${learning_rate} ;;
  }
}
