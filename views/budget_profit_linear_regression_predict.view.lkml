view: budget_profit_linear_regression_predict {
  derived_table: {
    sql:  SELECT *
          FROM
            ML.PREDICT(MODEL `linear_model_example.linear_model_v2`,
              (
              SELECT *
              FROM `linear_model_example.input_view_v2`
              )
            );;
  }
  dimension: TV {
    label: "TV"
    description: "Presupuesto de promocion en TV"
    type: number
    sql: ${TABLE}.TV ;;
  }
  dimension: Radio {
    label: "Radio"
    description: "Presupuesto de promocion en radio (millones)"
    type: number
    sql: ${TABLE}.Radio ;;
  }
  dimension: Social_Media {
    label: "Social_Media"
    description: "Presupuesto de promocion en redes sociales (millones)"
    type: number
    sql: ${TABLE}.Social_Media ;;
  }
  dimension: Mega_Influencer {
    label: "Mega_Influencer"
    description: "1 millon + seguidores"
    type: number
    sql: ${TABLE}.Mega_Influencer ;;
  }
  dimension: Macro_Influencer {
    label: "Macro_Influencer"
    description: "100,000 – 1 millon seguidores"
    type: number
    sql: ${TABLE}.Macro_Influencer ;;
  }
  dimension: Micro_Influencer {
    label: "Micro_Influencer"
    description: "10,000 – 100,000 seguidores"
    type: number
    sql: ${TABLE}.Micro_Influencer ;;
  }
  dimension: Nano_Influencer {
    label: "Nano_Influencer"
    description: "10,000 seguidores o menos"
    type: number
    sql: ${TABLE}.Nano_Influencer ;;
  }
  dimension: Influencer {
    label: "Influencer"
    description: "Tipos de influencer"
    type: string
    sql: (CASE
            WHEN ${TABLE}.Mega_Influencer = 1 THEN "Mega"
            WHEN ${TABLE}.Macro_Influencer = 1 THEN "Macro"
            WHEN ${TABLE}.Micro_Influencer = 1 THEN "Micro"
            WHEN ${TABLE}.Nano_Influencer = 1 THEN "Nano"
          END) ;;
  }
  dimension: Sales {
    label: "Sales"
    description: "Monto en ventas (millones)"
    type: number
    sql: ${TABLE}.Sales ;;
  }
  dimension: predicted_Sales {
    label: "predicted_Sales"
    description: "Predicción de monto en ventas (millones)"
    type: number
    sql: ${TABLE}.predicted_Sales ;;
  }

  ##Measures
  measure: sum_TV{
    label: "TV"
    type: sum
    sql:  ${TV};;
  }
  measure: sum_social_media{
    label: "Social_Media"
    type: sum
    sql:  ${Social_Media};;
  }
  measure: sum_Radio{
    label: "Radio"
    type: sum
    sql:  ${Radio};;
  }
  measure: Sum_Predict_Sales{
    type: sum
    sql:  ${predicted_Sales};;
  }
  measure: Sum_Sales{
    type: sum
    sql:  ${Sales};;
  }
  measure: Num_Predict_Sales{
    type: number
    sql:  ${predicted_Sales};;
  }
  measure: Num_Sales{
    type: number
    sql:  ${Sales};;
  }
  measure: Min_Predict_Sales{
    type: min
    sql:  ${predicted_Sales};;
  }
  measure: Min_Sales{
    type: min
    sql:  ${Sales};;
  }
  measure: Avg_Predict_Sales{
    type: average
    sql:  ${predicted_Sales};;
  }
  measure: Avg_Sales{
    type: average
    sql:  ${Sales};;
  }
  measure: Num_Sales_difference{
    type: number
    sql:  ABS(${Sales} - ${predicted_Sales});;
  }
  measure: Sales_difference{
    type: sum
    sql:  ABS(${Sales} - ${predicted_Sales});;
  }
  measure: count_Mega_Influencer  {
    type: sum
    sql:  ${Mega_Influencer};;
  }
  measure: count_Macro_Influencer  {
    type: sum
    sql:  ${Macro_Influencer};;
  }
  measure: count_Micro_Influencer  {
    type: sum
    sql:  ${Mega_Influencer};;
  }
  measure: count_Nano_Influencer  {
    type: sum
    sql:  ${Mega_Influencer};;
  }
  measure: count_influencer {
    type: count
    drill_fields: [Influencer]
  }
}
