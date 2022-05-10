view: hotels_reservation_cancel_confusion_matrix {
  derived_table: {
    sql: SELECT
      expected_label,
      _0,
      _1
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

  dimension: expected_label {
    type: number
    sql: ${TABLE}.expected_label ;;
  }

  dimension: label_0 {
    type: number
    sql: ${TABLE}._0 ;;
  }

  dimension: label_1 {
    type: number
    sql: ${TABLE}._1 ;;
  }

  set: detail {
    fields: [expected_label, label_1, label_0]
  }
}
