view: gbmodel_rotacion_personal {
  derived_table: {
    sql: SELECT
        predicted_leaving,
        leaving,
        probability
      FROM
        ML.EXPLAIN_PREDICT(MODEL `eon-internal-bigquery.POC.TEST_HR_ANALYTICS_TREE_MODEL`,
          (
          SELECT
            *
          FROM
            `eon-internal-bigquery.POC.HR_ANALYTICS` ))
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: predicted_leaving {
    type: yesno
    sql: ${TABLE}.predicted_leaving ;;
  }

  dimension: leaving {
    type: yesno
    sql: ${TABLE}.leaving ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  set: detail {
    fields: [predicted_leaving, leaving, probability]
  }
}
