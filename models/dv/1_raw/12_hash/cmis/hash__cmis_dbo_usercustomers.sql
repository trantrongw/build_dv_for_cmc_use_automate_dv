{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_usercustomers"
derived_columns:
  dv_recordsource: "DV_RECORD_SOURCE"
  dv_load_timestamp: cast( [DV_APPLIED_DATE] as DATETIME2(6))
  user_code: "UserID"
  customer_code: "CustomerID"
  dv_tenant_id: "!default"
  dv_collisioncode: "!default"
  dv_cdk_l_user_customer: "ID"
hashed_columns: 
    dv_hash_key_h_customer:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "customer_code"
    dv_hash_key_h_user:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "user_code"
    dv_hash_key_l_user_customer:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "user_code"
    - "customer_code"
    - "dv_cdk_l_user_customer"
    dv_hashdiff_s_l_user_customer:
      is_hashdiff: true
      columns:
        - "AccountType"
        - "Activate"
        - "GroupID" 
    dv_hashdiff_s_l_user_customer_rt:
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