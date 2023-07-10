{%- set yaml_metadata -%}
source_model: "hash__cmis_dbo_OrderDetails"
src_pk: 
  - "dv_hash_key_l_orderdetail"
src_payload:
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
src_hashdiff: "dv_hashdiff_s_l_orderdetail"
src_ldts: "dv_load_timestamp"
src_source: "dv_recordsource"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                      src_payload=metadata_dict["src_payload"],
                      src_hashdiff=metadata_dict["src_hashdiff"],
                      src_ldts=metadata_dict["src_ldts"],
                      src_source=metadata_dict["src_source"],
                      source_model=metadata_dict["source_model"]) }}