view: hotel_cancelation_predict {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: SELECT
IsCanceled,
predicted_IsCanceled,
predicted_IsCanceled_probs
FROM
  ML.PREDICT(MODEL `eon-internal-bigquery.hotels_sample_dataset.MY_GBT_MODEL`,
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
      AND '2017-12-31')) ;;
  #
  # # Define your dimensions and measures here, like this:
  measure: Original {
    label: "Original"
    description: "Reservaciones que fueron canceladas"
    type: number
    sql: ${TABLE}.IsCanceled ;;
  }
  measure: Predichas {
    label: "Predicted"
    description: "Prediccion de reservaciones que fueron canceladas"
    type: number
    sql: ${TABLE}.predicted_IsCanceled ;;
  }

  measure: Probabilidad {
    label: "Radio"
    description: "Probabilidad con la fue predicho"
    type: number
    sql: ${TABLE}.predicted_IsCanceled_probs ;;
  }
}
