{%- set yaml_metadata -%}
source_model: stg__cmis_dbo_usercustomers
derived_columns:
  dv_recordsource: DV_RECORD_SOURCE
  dv_load_timestamp: cast( DV_APPLIED_DATE as DATETIME2(6))
  user_code: CustomerID
  customer_code: UserID
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
  dv_depc_sat_lnk_usercustomer: ID
hashed_columns: 
    dv_hash_key_hub_customer:
    - dv_tenant_id
    - dv_collisioncode
    - customer_code
    dv_hash_key_hub_user:
    - dv_tenant_id
    - dv_collisioncode
    - user_code
    dv_hash_key_lnk_usercustomer:
    - dv_tenant_id
    - dv_collisioncode
    - user_code
    - customer_code
    dv_hashdiff_sat_lnk_usercustomer:
      is_hashdiff: true
      columns:
        - AccountType
        - Activate
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}