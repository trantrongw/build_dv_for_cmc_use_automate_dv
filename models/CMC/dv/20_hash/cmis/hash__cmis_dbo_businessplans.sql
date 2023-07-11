{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_businessplans"
derived_columns:
  dv_recordsource: "DV_RECORD_SOURCE"
  dv_load_timestamp: cast( DV_APPLIED_DATE as DATETIME2(6))
  opportunity_code: cast([OpportunityID] as VARCHAR(8000))
  businessplan_code: cast([ID] as VARCHAR(8000))
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_h_opportunity:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "opportunity_code"
    dv_hash_key_h_businessplan:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "businessplan_code"
    dv_hash_key_l_opportunity_businessplan:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "opportunity_code"
    - "businessplan_code"
    dv_hashdiff_s_h_businessplan:
      is_hashdiff: true
      columns:
        - "[Profit]"
        - "[Activate]"
        - "[PublishType]"
        - "[WFIsFinish]"
        - "[IsDeleted]"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}