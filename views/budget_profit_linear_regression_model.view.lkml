view: budget_profit_linear_regression_model {
  derived_table: {
     sql: SELECT
              CASE
                  WHEN processed_input = "__INTERCEPT__"
                      THEN "Constante"
                  ELSE processed_input
              END AS processed_input,
              ROUND(
                  (CASE
                      WHEN processed_input IN ("Mega_Influencer", "Macro_Influencer", "Micro_Influencer", "Nano_Influencer")
                          THEN ABS(weight)
                      WHEN processed_input = "__INTERCEPT__"
                          THEN -1 * weight
                      ELSE weight
                  END), 2) AS weight,
          FROM ML.WEIGHTS(MODEL `linear_model_example.linear_model_v2`);;
   }
  dimension: processed_input {
    description: "processed_input"
    type: string
    sql: ${TABLE}.processed_input ;;
  }

  dimension: weight {
    description: "weight"
    type: number
    sql: ${TABLE}.weight ;;
  }

   measure: sum_weight {
     description: "sum_weight"
     type: number
     sql: ${weight} ;;
   }
}
