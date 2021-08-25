connection: "curso_looker"

access_grant: can_see_mail {
  user_attribute: can_see_mail
  allowed_values: ["yes"]
}

# include all the views
include: "/views/**/*.view"

datagroup: curso_looker_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: curso_looker_project_default_datagroup

explore: mx_vw_data_vw_prod_history {}

explore: source_dt {}

explore: native_derived_table {
  sql_always_where: {% if _user_attributes['can_see_mail'] == 'yes'%}
                      ${resort_id} == '3406'
                    {% endif %};;
}

explore: persistent_derived_table {
  view_name: persistent_derived_table
}

explore: pdt_extended {
  extends: [persistent_derived_table]
  fields: [persistent_derived_table.reservation_number,persistent_derived_table.reservation_date]
}
