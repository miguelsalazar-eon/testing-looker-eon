view: budged_and_sales_predict_lr {
  derived_table: {
    sql:
        SELECT *
        FROM ML.PREDICT(
          MODEL `linear_model_example.budged_and_sales_model`,
          (
            SELECT *
            FROM linear_model_example.input_view
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
  dimension: Influencer {
    label: "Influencer"
    description: "Tamaño de influencer"
    type: string
    sql: ${TABLE}.Influencer ;;
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
  measure: sum_TV{
    label: "TV"
    type: sum
    sql:  ${predicted_Sales};;
  }
  measure: sum_Radio{
    label: "Radio"
    type: sum
    sql:  ${predicted_Sales};;
  }
  measure: Sum_Predict_Sales{
    type: sum
    sql:  ${predicted_Sales};;
  }
  measure: Sum_Sales{
    type: sum
    sql:  ${Sales};;
  }
  measure: Sales_difference{
    type: sum
    sql:  ABS(${Sales} - ${predicted_Sales});;
  }
  measure: count {
    type: count
    drill_fields: [Influencer]
  }


}
