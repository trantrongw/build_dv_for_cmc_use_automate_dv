{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_opportunities"
derived_columns:
  dv_recordsource: "dv_record_source"
  dv_load_timestamp: cast( dv_applied_date as DATETIME2(6))
  opportunity_code: cast(Code as VARCHAR(8000))
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_h_opportunity:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "opportunity_code"
    dv_hash_key_l_opportunity_sa:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "ID"
    - "Code"
    dv_master_hash_key_h_opportunity:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "Code"
    dv_duplicate_hash_key_h_opportunity:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "ID"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}