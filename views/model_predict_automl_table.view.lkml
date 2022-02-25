view: model_predict_automl_table {
  derived_table: {
    sql:SELECT
          *
          FROM prediction_number_of_reserva_20210901021305_2021_09_01T13_30_50_929Z.predictions,
          UNNEST(predicted_number_of_reservations)
;;
  }
  dimension: number_of_reservations {
    label: "number_of_reservations"
    type: number
    sql: ${TABLE}.number_of_reservations ;;
  }
  dimension: hotel_id {
    label: "hotel_id"
    type: string
    sql: ${TABLE}.hotel_id ;;
  }
  dimension: canal {
    label: "canal"
    type: string
    sql: ${TABLE}.canal ;;
  }
  dimension: tipohabitacionuso_id {
    label: "tipohabitacionuso_id"
    type: string
    sql: ${TABLE}.tipohabitacionuso_id ;;
  }
  dimension: month {
    label: "month"
    type: string
    sql: ${TABLE}.month ;;
  }
  dimension: category {
    label: "category"
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: predicted_number_of_reservations_tables_value {
    label: "predicted_number_of_reservations_tables_value"
    type: number
    sql: ${TABLE}.tables.value ;;
  }
  measure: count_reservations{
    type: sum
    sql: ${number_of_reservations} ;;
  }
  measure: count_predicted_reservations {
    type: sum
    sql: ${predicted_number_of_reservations_tables_value} ;;
  }
}
