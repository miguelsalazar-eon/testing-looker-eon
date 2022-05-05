view: hotel_cacelations_explain {
  derived_table: {
    sql: SELECT
        precision,
        accuracy,
        roc_auc
      FROM
        ML.EVALUATE(MODEL hotels_sample_dataset.MY_GBT_MODEL,
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
            AND '2017-12-31' ))
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: precision {
    type: number
    sql: ${TABLE}.precision ;;
  }

  measure: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  measure: roc_auc {
    type: number
    sql: ${TABLE}.roc_auc ;;
  }

  set: detail {
    fields: [precision, accuracy, roc_auc]
  }
}
