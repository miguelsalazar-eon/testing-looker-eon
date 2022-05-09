view: hotel_reservation_canceled_explain_predict {
  derived_table: {
    sql: SELECT
      IsCanceled,
      predicted_IsCanceled,
      probability
      FROM
        ML.EXPLAIN_PREDICT(MODEL `eon-internal-bigquery.hotels_sample_dataset.MY_GBT_MODEL`,
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

  dimension: is_canceled {
    type: number
    sql: ${TABLE}.IsCanceled ;;
  }

  dimension: predicted_is_canceled {
    type: number
    sql: ${TABLE}.predicted_IsCanceled ;;
  }

  measure: count_real_one {
    type:  count
    filters: [is_canceled: "= 1"]
    drill_fields: [is_canceled]
  }

  measure: count_real_zero {
    type:  count
    filters: [is_canceled: "= 0"]
    drill_fields: [is_canceled]
  }

  measure: count_predict_one {
    type:  count
    filters: [predicted_is_canceled: "= 1"]
    drill_fields: [predicted_is_canceled]
  }

  measure: count_predict_zero {
    type:  count
    filters: [predicted_is_canceled: "= 0"]
    drill_fields: [predicted_is_canceled]
  }

}
