view: persistent_derived_table {
  derived_table: {
    explore_source: source_dt {
      column: reservation_number {
        field: source_dt.confirmation_no
      }
      column: resort_id {
        field: source_dt.resort
      }
      column: status {
        field: source_dt.resv_status
      }
      column: room_category {}
      column: app_user {}
      column: total_revenue {}
      column: total_gross {}
      column: reservation_date {}
      derived_column: reservation_number_hashed {
        sql: MD5(reservation_number) ;;
      }
      filters: [source_dt.resv_status: "DEFINITIVE, CHECKED IN"]
    }
    datagroup_trigger: curso_looker_project_default_datagroup
    # persist_for: "60 minutes"
  }
  dimension: reservation_number {
    type: string
  }
  dimension: resort_id {
    type: string
  }
  dimension: status {
    type: string
  }
  dimension: room_category {
    type: string
  }
  dimension: app_user {
    type: string
  }
  dimension: total_revenue {
    type: number
  }
  dimension: total_gross {
    type: number
  }
  dimension: reservation_date {
    type: date
  }
  dimension: reservation_number_hashed {
    type: string
  }

  measure: sum_total_gross {
    type: sum
    sql: ${total_gross} ;;
    value_format_name: usd
  }
  measure: sum_total_revenue {
    type: sum
    sql: ${total_revenue} ;;
    value_format_name: usd
  }
}
