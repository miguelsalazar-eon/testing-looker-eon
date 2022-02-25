view: budget_and_sales_input_data {
  derived_table: {
    sql:SELECT * FROM  linear_model_example.input_view;;
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
  dimension: Ventas {
    label: "Ventas"
    description: "Monto en ventas (millones)"
    type: number
    sql: ${TABLE}.Ventas ;;
  }
}
