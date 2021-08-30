view: reservation_prediction {
  derived_table: {
    sql:
        SELECT
          *
        FROM ml.PREDICT(
          MODEL ${model_bqml.SQL_TABLE_NAME},
          (SELECT
             *
           FROM ${input_data.SQL_TABLE_NAME}));;
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
  dimension: year {
    label: "year"
    type: string
    sql: ${TABLE}.year ;;
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
}
