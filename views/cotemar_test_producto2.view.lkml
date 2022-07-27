view: cotemar_test_producto2 {
  derived_table: {
    sql: WITH table_result as (
      SELECT * FROM ML.EXPLAIN_FORECAST(MODEL `eon-internal-bigquery.Cotemar.test_producto2`,
                          STRUCT (90 AS horizon, 0.8 AS confidence_level)))

      SELECT
      *
      FROM
      table_result
      WHERE
      ceil(time_series_data) = time_series_data
      AND time_series_timestamp <= '2020-12-17'

      UNION ALL

      SELECT
      *
      FROM
      table_result
      WHERE time_series_timestamp > '2020-12-17'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: lower_bound {
    type: sum
    sql: IF(${prediction_interval_upper_bound} < 0, 0, ${prediction_interval_lower_bound}) ;;
  }

  measure: upper_bound {
    type: sum
    sql: IF(${prediction_interval_upper_bound} < 0, 0, ${prediction_interval_upper_bound}) ;;
  }

  measure: optimal_data {
    type: sum
    sql: IF(${time_series_data} = 'forecast' AND ${time_series_data} > 0, ${time_series_data}, 0) ;;
  }

  measure: series_data {
    type: sum
    sql: IF(${time_series_data} = 'history' AND ${time_series_data} > 0, ${time_series_data}, 0) ;;
  }

  dimension_group: time_series_timestamp {
    type: time
    sql: ${TABLE}.time_series_timestamp ;;
  }

  dimension: time_series_type {
    type: string
    sql: ${TABLE}.time_series_type ;;
  }

  dimension: time_series_data {
    type: number
    sql: ${TABLE}.time_series_data ;;
  }

  dimension: time_series_adjusted_data {
    type: number
    sql: ${TABLE}.time_series_adjusted_data ;;
  }

  dimension: standard_error {
    type: number
    sql: ${TABLE}.standard_error ;;
  }

  dimension: confidence_level {
    type: number
    sql: ${TABLE}.confidence_level ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  dimension: trend {
    type: number
    sql: ${TABLE}.trend ;;
  }

  dimension: seasonal_period_yearly {
    type: number
    sql: ${TABLE}.seasonal_period_yearly ;;
  }

  dimension: seasonal_period_quarterly {
    type: number
    sql: ${TABLE}.seasonal_period_quarterly ;;
  }

  dimension: seasonal_period_monthly {
    type: number
    sql: ${TABLE}.seasonal_period_monthly ;;
  }

  dimension: seasonal_period_weekly {
    type: number
    sql: ${TABLE}.seasonal_period_weekly ;;
  }

  dimension: seasonal_period_daily {
    type: number
    sql: ${TABLE}.seasonal_period_daily ;;
  }

  dimension: holiday_effect {
    type: number
    sql: ${TABLE}.holiday_effect ;;
  }

  dimension: spikes_and_dips {
    type: number
    sql: ${TABLE}.spikes_and_dips ;;
  }

  dimension: step_changes {
    type: number
    sql: ${TABLE}.step_changes ;;
  }

  set: detail {
    fields: [
      time_series_timestamp_time,
      time_series_type,
      time_series_data,
      time_series_adjusted_data,
      standard_error,
      confidence_level,
      prediction_interval_lower_bound,
      prediction_interval_upper_bound,
      trend,
      seasonal_period_yearly,
      seasonal_period_quarterly,
      seasonal_period_monthly,
      seasonal_period_weekly,
      seasonal_period_daily,
      holiday_effect,
      spikes_and_dips,
      step_changes
    ]
  }
}
