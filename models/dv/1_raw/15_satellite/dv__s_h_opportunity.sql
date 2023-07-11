{%- set yaml_metadata -%}
source_model: "hash__cmis_dbo_opportunities"
src_pk: "dv_hash_key_h_opportunity"
src_hashdiff: "dv_hashdiff_s_h_opportunity"
src_payload:
  - "[CustomerID]"
  - "[SaleManID]"
  - "[OpportunityType]"
  - "[GroupID]"
  - "[EstimateRevenue]"
  - "[StatusID]"
  - "[PublishType]"
  - "[Activate]"
  - "[IsDeleted]"
  - "[ParentID]"
  - "[BusinessOpportunityID]"
  - "[CreatedDate]"
src_ldts: "dv_load_timestamp"
src_source: "dv_recordsource"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                   src_hashdiff=metadata_dict["src_hashdiff"],
                   src_payload=metadata_dict["src_payload"],
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"]
                   )   }}