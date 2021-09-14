view: model_bqml_arima {
  derived_table: {
    persist_for: "72 hours"
    # datagroup_trigger: bqml_datagroup
    sql_create:
               CREATE OR REPLACE MODEL
                    ${SQL_TABLE_NAME}
               OPTIONS (
                    model_type = 'ARIMA_PLUS',
                    time_series_timestamp_col = 'parsed_date',
                    time_series_data_col = 'number_of_reservations',
                    auto_arima = TRUE,
                    data_frequency = 'AUTO_FREQUENCY',
                    decompose_time_series = TRUE
               ) AS
                   SELECT
                      *
                   FROM ${input_data_arima.SQL_TABLE_NAME};;
  }
}
