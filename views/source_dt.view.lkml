view: source_dt {
  sql_table_name: `EON_raw.MX_VW_PROD_HISTORY`
    ;;

  dimension: confirmation_no {
    type: string
    sql: ${TABLE}.CONFIRMATION_NO ;;
    primary_key: yes
  }

  dimension: resv_status {
    type: string
    sql: ${TABLE}.RESV_STATUS ;;
  }

  dimension: resort {
    type: string
    sql: ${TABLE}.RESORT ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension: room_category {
    type: string
    sql: ${TABLE}.ROOM_CATEGORY ;;
  }

  dimension: app_user {
    type: string
    sql: ${TABLE}.APP_USER ;;
  }

  dimension_group: reservation {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.RESERVATION_DATE ;;
    datatype: date
  }

  dimension: total_revenue {
    type: string
    sql: ${TABLE}.TOTAL_REVENUE ;;
    value_format_name: usd
  }

  dimension: total_gross {
    type: string
    sql: ${TABLE}.TOTAL_GROSS ;;
    value_format_name: usd
  }

  measure: client_id_count {
    type: count_distinct
    sql: ${client_id} ;;
  }

  measure: resort_id_count {
    type: count_distinct
    sql: ${resort} ;;
  }

  measure: confirmation_no_count {
    type: count_distinct
    sql: ${confirmation_no} ;;
  }

  measure: average_revenue {
    type: average
    sql: ${total_revenue} ;;
    value_format_name: usd
  }

  measure: average_gross {
    type: average
    sql: ${total_gross} ;;
    value_format_name: usd
  }

  measure: count {
    type: count
  }
}
