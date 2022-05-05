view: budget_profit_series {
  derived_table: {
    sql:  SELECT inversion FROM UNNEST(GENERATE_ARRAY(1, 100)) AS inversion;;
  }

  dimension: inversion {
    description: "Inversion en millones"
    type:  number
  }

  measure: ventas_tv {
    description: "Ventas por cantidad invertida en el canal de tv"
    type:  number
    sql: ${inversion} * 3.52 ;;
  }

  measure: ventas_radio {
    description: "Ventas por cantidad invertida en el canal de radio"
    type:  number
    sql: ${inversion} * 0.09 ;;
  }

  measure: ventas_redes_sociales {
    description: "Ventas por cantidad invertida en el canal de redes sociales"
    type:  number
    sql: ${inversion} * 0.07 ;;
  }

  measure: ventas_totales {
    description: "Ventas por cantidad invertida en el canal de redes sociales"
    type:  number
    sql: ${ventas_tv} + ${ventas_radio} + ${ventas_redes_sociales} ;;
  }

}
