view: model_predict_automl {
  derived_table: {
    sql:
        SELECT
          *
        FROM ml.PREDICT(
          MODEL `EON_raw.AUTOML-TEST_model`,
          (SELECT
             *
           FROM ${input_data_automl.SQL_TABLE_NAME}));;
  }
  dimension: predicted_number_of_reservations {
    label: "predicted_number_of_reservations"
    type: number
    # sql: ${TABLE}.predicted_number_of_reservations ;;
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
  measure: count_reservations{
    type: sum
    sql: ${number_of_reservations} ;;
  }
  measure: count_predicted_reservations {
    type: sum
    sql: ${predicted_number_of_reservations} ;;
  }
}
