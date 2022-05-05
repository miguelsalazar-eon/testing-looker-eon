view: hotels_feature_importance {
  derived_table: {
    sql: SELECT
        feature,
        importance_gain
      FROM ML.FEATURE_IMPORTANCE(MODEL hotels_sample_dataset.MY_GBT_MODEL)
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

  dimension: importance_gain {
    type: number
    sql: ${TABLE}.importance_gain ;;
  }

  set: detail {
    fields: [feature, importance_gain]
  }
}
