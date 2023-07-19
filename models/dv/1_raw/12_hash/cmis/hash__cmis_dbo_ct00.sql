{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_ct00"
derived_columns:
  dv_recordsource: "dv_record_source"
  dv_load_timestamp: cast( dv_applied_date as DATETIME2(6))
  opportunity_code: "ma_vv" 
  invoice_code: "stt_rec" 
  dv_cdk_l_opportunity_invoice: "line_nbr"
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_h_opportunity:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "opportunity_code"
    dv_hash_key_h_invoice:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "invoice_code"
    dv_hash_key_l_opportunity_invoice:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "invoice_code"
    - "opportunity_code"
    - "dv_cdk_l_opportunity_invoice"
    dv_hashdiff_s_l_opportunity_invoice:
      is_hashdiff: true
      columns:
        - "[ngay_ct]"
        - "[ps_co]"
        - "[ps_no]"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}