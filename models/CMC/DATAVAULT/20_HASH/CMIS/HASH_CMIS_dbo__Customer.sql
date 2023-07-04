{%- set yaml_metadata -%}
source_model: STAGE_CMIS_dbo__Customer
derived_columns:
  DV_RECORD_SOURCE: '!CMIS_dbo__Customer'
  DV_LOAD_DATE: cast( DV_APPLIED_DATE as DATETIME)
  CUSTOMER_CODE: Code
  DV_TENANT_ID: '!default'
  DV_BKEY_CODE: '!default'
hashed_columns: 
    DV_CUSTOMER_HASHKEY:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - CUSTOMER_CODE
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}