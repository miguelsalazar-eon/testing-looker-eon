view: model_bqml {
  derived_table: {
    persist_for: "72 hours"
    # datagroup_trigger: bqml_datagroup
    sql_create:
               CREATE MODEL
                    ${SQL_TABLE_NAME}
               OPTIONS (
                    model_type='LINEAR_REG',
                    input_label_cols=['number_of_reservations']
               ) AS
                   SELECT
                      *
                   FROM ${input_data.SQL_TABLE_NAME};;
  }
}
