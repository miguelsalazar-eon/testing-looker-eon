view: hotels_reservation_cancel_confusion_matrix {
  derived_table: {
    sql: SELECT
    (CASE
        WHEN expected_label = 1
        THEN 'Reservaciones Canceladas'
        WHEN expected_label = 0 THEN 'Reservaciones no canceladas'
        END) AS clasificacion,
      _0 as count_zero,
      _1 as count_one
      FROM
        ML.CONFUSION_MATRIX(MODEL `eon-internal-bigquery.hotels_sample_dataset.MY_GBT_MODEL`,
          (
          SELECT
            IsCanceled,
            StaysInWeekendNights,
            StaysInWeekNights,
            Adults,
            Children,
            Babies,
            PreviousBookingsNotCanceled,
            Meal,
            Country,
            MarketSegment,
            ArrivalDateMonth,
            DepositType,
            CustomerType,
            LeadTime,
            RequiredCarParkingSpaces,
            ArrivalFullDate,
            FACT_ELEMENT,
            FACT_VALUE
          FROM
            `eon-internal-bigquery.hotels_sample_dataset.WEATHER_H1_JOINED_DATA`
          WHERE
            ArrivalFullDate BETWEEN '2017-01-01'
            AND '2017-12-31'))
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: sum_zero {
    label: "Reales"
    type: sum
    sql: ${count_zero} ;;
  }
  measure: sum_one {
    label: "Predicción"
    type: sum
    sql: ${count_one} ;;
  }

  dimension: clasificacion {
    type: string
    sql: ${TABLE}.clasificacion ;;
  }

  dimension: count_zero {
    type: number
    sql: ${TABLE}.count_zero ;;
  }

  dimension: count_one {
    type: number
    sql: ${TABLE}.count_one ;;
  }

  set: detail {
    fields: [clasificacion, count_zero, count_one]
  }
}
