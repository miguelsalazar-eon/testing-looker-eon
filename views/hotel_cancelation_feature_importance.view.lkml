view: hotel_cancelation_feature_importance {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: SELECT
  feature,
  importance_weight,
  importance_gain,
  importance_cover
FROM ML.FEATURE_IMPORTANCE(MODEL hotels_sample_dataset.MY_GBT_MODEL);;
      # # Define your dimensions and measures here, like this:
    dimension: caracteristica {
      label: "caracteristica"
      description: "Columna incluida en la evaluacion del modelo"
      type: number
      sql: ${TABLE}.feature ;;
    }
    measure: importance_gain {
      label: "importance_gain"
      description: "Importancia de la caracteristica a la hora de hacer la prediccion"
      type: number
      sql: ${TABLE}.importance_gain ;;
    }
  }
