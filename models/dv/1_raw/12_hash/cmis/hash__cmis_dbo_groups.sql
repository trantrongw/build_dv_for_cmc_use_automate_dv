{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_groups"
derived_columns:
  dv_recordsource: "DV_RECORD_SOURCE"
  dv_load_timestamp: cast( DV_APPLIED_DATE as DATETIME2(6))
  department_code: cast(ID as VARCHAR(8000))
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_h_department:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "department_code"
    dv_hashdiff_s_h_department:
      is_hashdiff: true
      columns:
        - "[ID]"
        - "[GroupName]"
        - "[GroupCode]"
        - "[Year]"
        - "[ParentID]"
        - "[IsActive]"
        - "[IsVirtual]"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}