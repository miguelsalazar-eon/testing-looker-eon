view: cotemar_comparacion {
  derived_table: {
    sql: WITH prediction AS
      (
        SELECT
          CAST(time_series_timestamp AS DATE) AS fecha_pedido,
          time_series_type,
          time_series_data AS Cantidad_predicha ,
          prediction_interval_upper_bound AS Cantidad_maxima,
          prediction_interval_lower_bound AS Cantidad_minima,
        FROM ML.EXPLAIN_FORECAST(MODEL `eon-internal-bigquery.Cotemar.test_producto_tortilla`, STRUCT (30 AS horizon, 0.8 AS confidence_level))
        WHERE time_series_type = 'forecast'
      ), history AS
      (
        SELECT
          Fecha_de_pedido,
          SUM(Cantidad_solicitada) AS Cantidad_solicitada
        FROM `eon-internal-bigquery.Cotemar.ME5A_2016_2022`
        WHERE Fecha_de_pedido IS NOT NULL
        AND Indicador_de_borrado = FALSE
        AND Nombre_del_proveedor IS NOT NULL
        AND Texto_breve='TORTILLA DE MAIZ KG'
        GROUP BY 1 ORDER BY Fecha_de_pedido DESC
      )
      SELECT
        p.*,
        h.Cantidad_solicitada
      FROM prediction AS p
      LEFT JOIN history AS h ON p.fecha_pedido = h.Fecha_de_pedido
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Cantidad_predicha {
    type: sum
    sql: ${cantidad_predicha} ;;
  }

  measure: Cantidad_historica {
    type: sum
    sql: ${cantidad_solicitada} ;;
  }

  dimension: fecha_pedido {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_pedido ;;
  }

  dimension: time_series_type {
    type: string
    sql: ${TABLE}.time_series_type ;;
  }

  dimension: cantidad_predicha {
    type: number
    sql: ${TABLE}.Cantidad_predicha ;;
  }

  dimension: cantidad_maxima {
    type: number
    sql: ${TABLE}.Cantidad_maxima ;;
  }

  dimension: cantidad_minima {
    type: number
    sql: ${TABLE}.Cantidad_minima ;;
  }

  dimension: cantidad_solicitada {
    type: number
    sql: ${TABLE}.Cantidad_solicitada ;;
  }

  set: detail {
    fields: [
      fecha_pedido,
      time_series_type,
      cantidad_predicha,
      cantidad_maxima,
      cantidad_minima,
      cantidad_solicitada
    ]
  }
}
