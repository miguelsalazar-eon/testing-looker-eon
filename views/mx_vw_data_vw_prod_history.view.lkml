view: mx_vw_data_vw_prod_history {
  sql_table_name: `EON_raw.MX_VW_PROD_HISTORY`
    ;;

  dimension: actualizar {
    type: string
    sql: ${TABLE}.ACTUALIZAR ;;
  }

  dimension: adults {
    type: number
    sql: ${TABLE}.ADULTS ;;
  }

  dimension: adv_room_revenue {
    type: number
    sql: ${TABLE}.ADV_ROOM_REVENUE ;;
  }

  dimension: agent_country {
    type: string
    sql: ${TABLE}.AGENT_COUNTRY ;;
  }

  dimension: agent_id {
    type: number
    sql: ${TABLE}.AGENT_ID ;;
  }

  dimension: allotment_header_id {
    type: number
    sql: ${TABLE}.ALLOTMENT_HEADER_ID ;;
  }

  dimension: app_user {
    type: string
    sql: ${TABLE}.APP_USER ;;
  }

  dimension: arr_persons {
    type: number
    sql: ${TABLE}.ARR_PERSONS ;;
  }

  dimension: arr_rooms {
    type: number
    sql: ${TABLE}.ARR_ROOMS ;;
  }

  dimension: audit_user {
    type: string
    sql: ${TABLE}.AUDIT_USER ;;
  }

  dimension: authorizer {
    type: string
    sql: ${TABLE}.AUTHORIZER ;;
  }

  dimension: av_rooms {
    type: number
    sql: ${TABLE}.AV_ROOMS ;;
  }

  dimension: av_rooms_rc {
    type: number
    sql: ${TABLE}.AV_ROOMS_RC ;;
  }

  dimension: av_rooms_rtc {
    type: number
    sql: ${TABLE}.AV_ROOMS_RTC ;;
  }

  dimension: begin_date {
    type: number
    sql: ${TABLE}.BEGIN_DATE ;;
  }

  dimension: business_date {
    type: number
    sql: ${TABLE}.BUSINESS_DATE ;;
  }

  dimension: cancellation_date {
    type: number
    sql: ${TABLE}.CANCELLATION_DATE ;;
  }

  dimension: cancellation_reason {
    type: string
    sql: ${TABLE}.CANCELLATION_REASON ;;
  }

  dimension: children {
    type: number
    sql: ${TABLE}.CHILDREN ;;
  }

  dimension: children1 {
    type: number
    sql: ${TABLE}.CHILDREN1 ;;
  }

  dimension: children2 {
    type: number
    sql: ${TABLE}.CHILDREN2 ;;
  }

  dimension: children3 {
    type: number
    sql: ${TABLE}.CHILDREN3 ;;
  }

  dimension: client_email {
    type: string
    sql: ${TABLE}.CLIENT_EMAIL ;;
    required_access_grants: [can_see_mail]
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
    required_access_grants: [can_see_mail]
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.CLIENT_NAME ;;
    required_access_grants: [can_see_mail]
  }

  dimension: comment_id {
    type: number
    sql: ${TABLE}.COMMENT_ID ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.COMMENTS ;;
  }

  dimension: company_country {
    type: string
    sql: ${TABLE}.COMPANY_COUNTRY ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.COMPANY_ID ;;
  }

  dimension: confirmation_no {
    type: string
    sql: ${TABLE}.CONFIRMATION_NO ;;
    primary_key: yes
  }

  dimension: consortia {
    type: string
    sql: ${TABLE}.CONSORTIA ;;
  }

  dimension: crs_no {
    type: string
    sql: ${TABLE}.CRS_NO ;;
  }

  dimension: dep_persons {
    type: number
    sql: ${TABLE}.DEP_PERSONS ;;
  }

  dimension: dep_rooms {
    type: number
    sql: ${TABLE}.DEP_ROOMS ;;
  }

  dimension: end_date {
    type: number
    sql: ${TABLE}.END_DATE ;;
  }

  dimension: extraction_date {
    type: number
    sql: ${TABLE}.EXTRACTION_DATE ;;
  }

  dimension: food_revenue {
    type: number
    sql: ${TABLE}.FOOD_REVENUE ;;
  }

  dimension: guest_country {
    type: string
    sql: ${TABLE}.GUEST_COUNTRY ;;
  }

  dimension: insert_date {
    type: number
    sql: ${TABLE}.INSERT_DATE ;;
  }

  dimension: lead_time {
    type: number
    sql: ${TABLE}.LEAD_TIME ;;
  }

  dimension: los_type {
    type: string
    sql: ${TABLE}.LOS_TYPE ;;
  }

  dimension: lt_type {
    type: string
    sql: ${TABLE}.LT_TYPE ;;
  }

  dimension: market_code {
    type: string
    sql: ${TABLE}.MARKET_CODE ;;
  }

  dimension: market_group {
    type: string
    sql: ${TABLE}.MARKET_GROUP ;;
  }

  dimension: non_revenue {
    type: number
    sql: ${TABLE}.NON_REVENUE ;;
  }

  dimension: oo_rooms {
    type: number
    sql: ${TABLE}.OO_ROOMS ;;
  }

  dimension: opera_id {
    type: number
    sql: ${TABLE}.OPERA_ID ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.ORIGIN ;;
  }

  dimension: other_revenue {
    type: number
    sql: ${TABLE}.OTHER_REVENUE ;;
  }

  dimension: promotions {
    type: string
    sql: ${TABLE}.PROMOTIONS ;;
  }

  dimension: rate_category {
    type: string
    sql: ${TABLE}.RATE_CATEGORY ;;
  }

  dimension: rate_class {
    type: string
    sql: ${TABLE}.RATE_CLASS ;;
  }

  dimension: rate_code {
    type: string
    sql: ${TABLE}.RATE_CODE ;;
  }

  dimension: reservation_date {
    type: number
    sql: ${TABLE}.RESERVATION_DATE ;;
  }

  dimension: reservations {
    type: number
    sql: ${TABLE}.RESERVATIONS ;;
  }

  dimension: resort {
    type: string
    sql: ${TABLE}.RESORT ;;
  }

  dimension: resort_original {
    type: string
    sql: ${TABLE}.RESORT_ORIGINAL ;;
  }

  dimension: results {
    type: number
    sql: ${TABLE}.RESULTS ;;
  }

  dimension: resv_status {
    type: string
    sql: ${TABLE}.RESV_STATUS ;;
  }

  dimension: revenue_leg {
    type: number
    sql: ${TABLE}.REVENUE_LEG ;;
  }

  dimension: room_category {
    type: string
    sql: ${TABLE}.ROOM_CATEGORY ;;
  }

  dimension: room_class {
    type: string
    sql: ${TABLE}.ROOM_CLASS ;;
  }

  dimension: room_revenue {
    type: number
    sql: ${TABLE}.ROOM_REVENUE ;;
  }

  dimension: rtc_category {
    type: string
    sql: ${TABLE}.RTC_CATEGORY ;;
  }

  dimension: rtc_class {
    type: string
    sql: ${TABLE}.RTC_CLASS ;;
  }

  dimension: source_code {
    type: string
    sql: ${TABLE}.SOURCE_CODE ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: stay_rooms {
    type: number
    sql: ${TABLE}.STAY_ROOMS ;;
  }

  dimension: territory {
    type: string
    sql: ${TABLE}.TERRITORY ;;
  }

  dimension: tlt_type {
    type: string
    sql: ${TABLE}.TLT_TYPE ;;
  }

  dimension: to_country {
    type: string
    sql: ${TABLE}.TO_COUNTRY ;;
  }

  dimension: total_gross {
    type: number
    sql: ${TABLE}.TOTAL_GROSS ;;
  }

  dimension: total_lead_time {
    type: number
    sql: ${TABLE}.TOTAL_LEAD_TIME ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.TOTAL_REVENUE ;;
  }

  dimension: tour_operator_id {
    type: number
    sql: ${TABLE}.TOUR_OPERATOR_ID ;;
  }

  dimension: travel_reason {
    type: string
    sql: ${TABLE}.TRAVEL_REASON ;;
  }

  dimension: vip_status {
    type: string
    sql: ${TABLE}.VIP_STATUS ;;
  }

  measure: count {
    type: count
    drill_fields: [client_name]
  }
}
