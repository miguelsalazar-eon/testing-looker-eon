view: cotemar_model_explain_forecast_arima {
  derived_table: {
    sql:
      WITH explain_forecast AS (
      SELECT
        *
      FROM
        ML.EXPLAIN_FORECAST(MODEL Cotemar.test_arima,
          STRUCT(90 AS horizon,
            0.8 AS confidence_level) )
      )
      SELECT
        CAST(time_series_timestamp AS DATE) time_series_timestamp,
        time_series_data,
        prediction_interval_lower_bound,
        prediction_interval_upper_bound,
        time_series_type
      FROM
        explain_forecast
      WHERE
        time_series_type = "forecast"

      UNION ALL

      SELECT
      Fecha_de_solicitud AS time_series_timestamp,
      SUM(Cantidad_solicitada) AS time_series_data,
      NULL as prediction_interval_lower_bound,
      NULL as prediction_interval_upper_bound,
      "history" as time_series_type,
    FROM
      Cotemar.ME5A_2016_2022
    WHERE
      Texto_breve = "LIMON KG"
    GROUP BY
      Fecha_de_solicitud
      ;;
  }

  dimension: time_series_type {type: string}

  dimension: time_series_data {
    type: number
    sql: CASE WHEN ${time_series_type} = "forecast" THEN NULL ELSE ${TABLE}.time_series_data END;;
    }


  dimension: time_series_data_predict {
    type:number
    sql:CASE WHEN ${time_series_type} = "history" THEN NULL ELSE ${TABLE}.time_series_data END;;
  }



  dimension: prediction_interval_lower_bound {type: number}
  dimension: prediction_interval_upper_bound {type: number}
  dimension: time_series_timestamp {type:date}
  #dimension: Texto_breve {type: string}




  measure: lower_bound {
    type: sum
    sql: ${prediction_interval_lower_bound} ;;
  }
  measure: upper_bound {
    type: sum
    sql: ${prediction_interval_upper_bound} ;;
  }
  measure: data {
    type: sum
    sql: ${TABLE}.time_series_data ;;
  }
  measure: series_data {
    type: sum
    sql: ${time_series_data} ;;
  }

  measure: series_data_predict {
    type: sum
    sql: if(${time_series_data_predict}<0,0,${time_series_data_predict});;
  }
}
