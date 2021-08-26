view: date_picker {
  # sql_table_name: `raw_excellence.pms_produccion`
  suggestions: no
  derived_table: {
    sql: SELECT
          RESORT,
          CONFIRMATION_NO,
          CLIENT_ID,
          APP_USER,
          RESERVATION_DATE,
          RESV_STATUS
         FROM `MX_VW_PROD_HISTORY`
         WHERE {% condition reserv_date_filter %} MX_VW_PROD_HISTORY.RESERVATION_DATE {% endcondition %}
        ;;
    }

    filter: reserv_date_filter {
      type: date
    }

    dimension: RESORT {
      label: "Resort id"
      type: string
      sql: ${TABLE}.RESORT ;;
    }

    dimension: CONFIRMATION_NO {
      label: "Numero Confirmacion"
      type: string
      sql: ${TABLE}.CONFIRMATION_NO ;;
    }

    dimension: CLIENT_ID {
      label: "Client id"
      type: string
      sql: ${TABLE}.CLIENT_ID ;;
    }

    dimension: APP_USER {
      label: "App user"
      type: string
      sql: ${TABLE}.APP_USER ;;
    }

    dimension: RESERVATION_DATE {
      label: "Reservation Date"
      type: date
      sql: ${TABLE}.RESERVATION_DATE;;
      # html: {{ rendered_value | date: "%Y %B" }};;
    }

    dimension: RESV_STATUS {
      label: "Reservation Status"
      type: string
      sql: ${TABLE}.RESV_STATUS ;;
    }
}
