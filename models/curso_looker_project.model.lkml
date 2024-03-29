connection: "curso_looker"

access_grant: can_see_mail {
  user_attribute: can_see_mail
  allowed_values: ["yes"]
}

# include all the views
include: "/views/**/*.view"

datagroup: curso_looker_project_default_datagroup {
  # sql_trigger: SELECT MAX(CONFIRMATION_NO) FROM EON_raw.MX_VW_PROD_HISTORY;;
  max_cache_age: "1 hour"
}

persist_with: curso_looker_project_default_datagroup

explore: mx_vw_data_vw_prod_history {}

explore: source_dt {}

explore: native_derived_table {
  sql_always_where: {% if _user_attributes['can_see_mail'] == 'yes'%}
                      ${resort_id} = '3406'
                    {% endif %};;
}

explore: persistent_derived_table {
  view_name: persistent_derived_table
}

explore: pdt_extended {
  extends: [persistent_derived_table]
  fields: [persistent_derived_table.reservation_number,persistent_derived_table.reservation_date]
}

explore: date_picker {}

datagroup: orders_datagroup {
  sql_trigger: SELECT max(year) FROM EON_raw.MX_VW_PROD_HISTORY ;;
  max_cache_age: "1 hours"
  label: "Actualizacion de datos cada hora"
  description: "Trigger cuando un año es agregado."
}

### Bigquery ML lineal regresor Code

explore: input_data {}

explore: model_bqml {}

explore: reservation_linear_reg_training {}

explore: reservation_linear_reg_eval {}

explore: reservation_prediction {}

### Bigquery ML Arima Plus Code

explore: input_data_arima{}

explore: model_bqml_arima {}

explore: model_arima_evaluate {}

explore: model_explain_forecast_arima {}


explore: cotemar_model_explain_forecast_arima {}

### Bigquery ML AUTOML_REGRESSOR Code

explore: input_data_automl{}

explore: model_predict_automl {}

explore: model_predict_automl_table {}

### Bigquery Linear Regression Model for budged and sales Code

explore: budget_and_sales_input_data {}

explore: budged_and_sales_predict_lr {}

explore: budget_profit_linear_regression_model {}

explore: budget_profit_linear_regression_predict {}

explore: budget_profit_series {}

explore: hotel_reservation_canceled_explain_predict {}

explore: hotels_feature_importance{}

explore: hotel_cacelations_explain{}

explore: hotels_reservation_cancel_confusion_matrix {}

explore: gbmodel_rotacion_personal {}

explore: gbmodel_rotacion_personal_explain {}

explore: gbmodel_rotacion_personal_feature_importance {}

### Bigquery ML Arima Plus Code for Cotenmar

explore: cotemar_test_producto1 {}

explore: cotemar_test_producto2 {}

explore: cotemar_test_producto3 {}

explore: cotemar_comparacion {}
