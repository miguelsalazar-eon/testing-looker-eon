view: input_data {
  derived_table: {
    sql:SELECT
          COUNT(*) AS number_of_reservations,
          reserv.RESORT AS hotel_id,
          reserv.MARKET_GROUP AS canal,
          reserv.ROOM_CLASS AS tipohabitacionuso_id,
          FORMAT_DATE("%Y",reserv.RESERVATION_DATE) AS year,
          FORMAT_DATE("%m",reserv.RESERVATION_DATE) AS month,
          reserv.RATE_CATEGORY AS category,
          FROM EON_raw.MX_VW_PROD_HISTORY reserv
          WHERE reserv.RESV_STATUS IN ('DEFINITIVE','CHECKED IN')
               and reserv.BEGIN_DATE is not NULL
          GROUP BY reserv.MARKET_GROUP, reserv.RESORT, reserv.ROOM_CLASS, year, month, reserv.RATE_CATEGORY
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
