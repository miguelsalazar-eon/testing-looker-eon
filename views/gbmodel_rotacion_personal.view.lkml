view: gbmodel_rotacion_personal {
  derived_table: {
    sql: SELECT
  predicted_leaving,
  leaving,
  CASE
    WHEN predicted_leaving = leaving THEN 'CORRECT'
    ELSE 'INCORRECT'
  END AS result,
  probability
      FROM ML.EXPLAIN_PREDICT(MODEL `eon-internal-bigquery.POC.TEST_HR_ANALYTICS_TREE_MODEL`,
  (
    SELECT
      *
    FROM
      eon-internal-bigquery.POC.HR_ANALYTICS )
  )
;;
}

  measure: count {
    type: count
    drill_fields: [detail*]
  }

    dimension: results {
      type: string
      sql: ${TABLE}.result;;
    }

    measure: count_results {
      type: count
      drill_fields: [results]
    }

  dimension: predicted_leaving {
    type: yesno
    sql: ${TABLE}.predicted_leaving = true;;
  }

  measure: count_predicted {
    type: count
    drill_fields: [predicted_leaving]
    #filters: [predicted_leaving, "Yes"]
  }

  dimension: leaving {
    type: yesno
    sql: ${TABLE}.leaving = true;;
  }

  measure: count_leaving {
    type: count
    drill_fields: [leaving]
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

dimension: sort_predicted {
  type: number
  sql: if(${predicted_leaving} = 'Yes', 0,

        if(${predicted_leaving} = 'No', 1,

        )
      ) ;;
}
  set: detail {
    fields: [predicted_leaving, leaving, probability, results]
  }
}
