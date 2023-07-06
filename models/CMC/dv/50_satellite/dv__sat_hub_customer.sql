{%- set yaml_metadata -%}
source_model: hash__cmis_dbo_customers_id
src_pk: dv_hash_key_customer
src_hashdiff: 
  source_column: dv_hashdiff_sat_customer
  alias: HASHDIFF
src_payload:
    - "Name"
    - "Address"
    - "Phone"
    - "Email"
src_ldts: dv_load_timestamp
src_source: dv_recordsource
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                   src_hashdiff=metadata_dict["src_hashdiff"],
                   src_payload=metadata_dict["src_payload"],
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"],
                   src_extra_columns=metadata_dict["src_extra_columns"]
                   )   }}