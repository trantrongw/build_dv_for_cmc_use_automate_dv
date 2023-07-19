{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_opportunities"
derived_columns:
  dv_recordsource: "dv_record_source"
  dv_load_timestamp: cast( dv_applied_date as DATETIME2(6))
  opportunity_code: cast(ID as VARCHAR(8000))
  customer_code: cast(CustomerID as VARCHAR(8000))
  user_code: cast(SaleManID as VARCHAR(8000))
  department_code: cast(GroupID as VARCHAR(8000))
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_h_opportunity:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "opportunity_code"
    dv_hash_key_h_customer:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "customer_code"
    dv_hash_key_h_user:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "user_code"
    dv_hash_key_h_department:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "department_code"
    dv_hash_key_l_opportunity_customer_user_department:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "opportunity_code"
    - "customer_code"
    - "user_code"
    - "department_code"
    dv_hashdiff_s_h_opportunity:
      is_hashdiff: true
      columns:
        - "[OpportunityType]"
        - "[EstimateRevenue]"
        - "[StatusID]"
        - "[PublishType]"
        - "[Activate]"
        - "[IsDeleted]"
        - "[ParentID]"
        - "[BusinessOpportunityID]"
        - "[CreatedDate]"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}