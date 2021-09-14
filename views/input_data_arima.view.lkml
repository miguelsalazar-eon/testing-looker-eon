view: input_data_arima {
  derived_table: {
    sql:SELECT
    count(*) as number_of_reservations,
    reserv.RESERVATION_DATE as parsed_date,
    FROM EON_raw.MX_VW_PROD_HISTORY reserv
    WHERE reserv.RESV_STATUS IN ('DEFINITIVE','CHECKED IN')
            and reserv.BEGIN_DATE is not NULL and reserv.RESORT = '34022'
    GROUP BY parsed_date
;;
  }
  dimension: number_of_reservations {
    label: "number_of_reservations"
    type: number
    sql: ${TABLE}.number_of_reservations ;;
  }
  dimension: parsed_date {
    label: "parsed_date"
    type: date_time
    sql: ${TABLE}.parsed_date ;;
  }
}
