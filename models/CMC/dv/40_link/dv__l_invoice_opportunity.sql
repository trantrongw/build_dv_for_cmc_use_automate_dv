{%- set yaml_metadata -%}
source_model: 
  - "hash__cmis_dbo_ct00"
src_pk: "dv_hash_key_l_invoice_opportunity"
src_fk: 
  - "dv_hash_key_h_invoice"
  - "dv_hash_key_h_opportunity"
  - "dv_cdk_l_invoice_opportunity"
src_ldts: "dv_load_timestamp"
src_source: "dv_recordsource"
src_extra_columns:
    - "dv_tenant_id"
    - "dv_collisioncode"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.link(src_pk=metadata_dict["src_pk"],
                    src_fk=metadata_dict["src_fk"], 
                    src_ldts=metadata_dict["src_ldts"],
                    src_source=metadata_dict["src_source"], 
                    source_model=metadata_dict["source_model"],
                    src_extra_columns=metadata_dict["src_extra_columns"]
                    ) }}
