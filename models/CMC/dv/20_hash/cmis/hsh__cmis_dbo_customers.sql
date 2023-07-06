{%- set yaml_metadata -%}
source_model: stg__cmis_dbo_customers
derived_columns:
  dv_recordsource: DV_RECORD_SOURCE
  dv_load_timestamp: cast( DV_APPLIED_DATE as DATETIME)
  customer_code1: ID
  customer_code2: Code
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_huh_customer1:
    - dv_tenant_id
    - dv_collisioncode
    - customer_code1
    dv_hash_key_huh_customer2:
    - dv_tenant_id
    - dv_collisioncode
    - customer_code2
    dv_hashdiff_sat_customer:
      is_hashdiff: true
      columns:
        - [Name]
        - [Address]
        - [Phone]
        - [Email]
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}