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

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

}
