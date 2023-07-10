{%- set yaml_metadata -%}
source_model: "stg__cmis_dbo_orderdetails"
derived_columns:
  dv_recordsource: "DV_RECORD_SOURCE"
  dv_load_timestamp: cast( DV_APPLIED_DATE as DATETIME2(6))
  solution_code: cast( SolutionBranchID as VARCHAR(4000))
  order_code: cast(OrderID as VARCHAR(8000))
  dv_cdk_l_orderdetail: "ID"
  dv_tenant_id: '!default'
  dv_collisioncode: '!default'
hashed_columns: 
    dv_hash_key_h_order:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "order_code"
    dv_hash_key_h_solution:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "solution_code"
    dv_hash_key_l_orderdetail:
    - "dv_tenant_id"
    - "dv_collisioncode"
    - "dv_cdk_l_orderdetail"
    - "order_code"
    - "solution_code"
    dv_hashdiff_s_l_orderdetail:
      is_hashdiff: true
      columns:
        - "[ID]"
        - "[Code]"
        - "[OrderID]"
        - "[OrderCode]"
        - "[SolutionBranchID]"
        - "[SolutionBranchNameID]"
        - "[ProductBranchID]"
        - "[VendorBranchID]"
        - "[ProductName]"
        - "[VATTypeID]"
        - "[PartNumber]"
        - "[Warranty]"
        - "[BeginDateWarranty]"
        - "[EndDateWarranty]"
        - "[Description]"
        - "[UnitName]"
        - "[Quantity]"
        - "[Tax]"
        - "[Price]"
        - "[TotalBeforeVAT]"
        - "[TotalVAT]"
        - "[TotalAfterVAT]"
        - "[CreatedDate]"
        - "[NameSolutionBranchID]"
        - "[NameSolutionBranchNameID]"
        - "[NameProductBranchID]"
        - "[NameVendorBranchID]"
        - "[NameVATTypeID]"
        - "[RetailTypeID]"
        - "[RetailConfigID]"
        - "[IsService]"
        - "[IsHardware]"
        - "[STTMis]"
        - "[GroupID]"
        - "[IsMain]"
        - "[ParentID]"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}