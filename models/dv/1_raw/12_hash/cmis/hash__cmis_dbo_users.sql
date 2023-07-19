{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_users"
derived_columns:
  dv_recordsource: "dv_record_source"
  dv_load_timestamp: cast( dv_applied_date as DATETIME2(6))
  user_code: cast(ID as VARCHAR(8000))
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_h_user:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "user_code"
    dv_hashdiff_s_h_user:
      is_hashdiff: true
      columns:
        - "[ID]"
        - "[FirstName]"
        - "[LastName]"
        - "[EmployeeCode]"
        - "[Gender]"
        - "[Active]"
        - "[BeginWorkDate]"
        - "[TitleID]"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}