view: gbmodel_rotacion_personal_explain {
  derived_table: {
    sql: SELECT
        precision,
        accuracy,
        roc_auc
      FROM
        ML.EVALUATE(MODEL `eon-internal-bigquery.POC.TEST_HR_ANALYTICS_TREE_MODEL`,
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

  dimension: precision {
    type: number
    sql: ${TABLE}.precision ;;
  }

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  dimension: roc_auc {
    type: number
    sql: ${TABLE}.roc_auc ;;
  }

  set: detail {
    fields: [precision, accuracy, roc_auc]
  }
}
