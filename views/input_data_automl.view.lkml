view: input_data_automl {
  derived_table: {
    sql:SELECT
          *
          FROM EON_raw.TEST_MX_VW_NUMBER_RESERVATIONS2
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
}
