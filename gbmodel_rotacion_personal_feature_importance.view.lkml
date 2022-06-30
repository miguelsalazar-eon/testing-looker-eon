view: gbmodel_rotacion_personal_feature_importance {
  derived_table: {
    sql: SELECT
        *
      FROM
        ML.FEATURE_IMPORTANCE(MODEL `eon-internal-bigquery.POC.TEST_HR_ANALYTICS_TREE_MODEL`)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: feature {
    type: string
    sql: ${TABLE}.feature ;;
  }

  dimension: importance_weight {
    type: number
    sql: ${TABLE}.importance_weight ;;
  }

  dimension: importance_gain {
    type: number
    sql: ${TABLE}.importance_gain ;;
  }

  dimension: importance_cover {
    type: number
    sql: ${TABLE}.importance_cover ;;
  }

  set: detail {
    fields: [feature, importance_weight, importance_gain, importance_cover]
  }
}
