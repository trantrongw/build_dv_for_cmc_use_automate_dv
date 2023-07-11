{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_customers"
derived_columns:
  dv_recordsource: "DV_RECORD_SOURCE"
  dv_load_timestamp: cast( DV_APPLIED_DATE as DATETIME2(6))
  customer_code: cast(ID as VARCHAR(8000))
  customer_code2: cast(Code as VARCHAR(8000))
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_h_customer:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "customer_code"
    dv_hash_key_h_customer2:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "customer_code2"
    dv_hashdiff_s_h_customer:
      is_hashdiff: true
      columns:
        - "Name"
        - "Address"
        - "Phone"
        - "Email"
    dv_hashdiff_s_h_customer_rt:
      is_hashdiff: true
      columns:
        - "DV_APPLIED_DATE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}