{%- set yaml_metadata -%}
source_model: 'hash__cmis_dbo_usercustomers'
src_pk: 'dv_hash_key_lnk_usercustomer'
src_cdk: 
  - 'dv_depc_sat_lnk_usercustomer'
src_payload:
  - 'AccountType'
  - 'Activate'
src_hashdiff: 'dv_hashdiff_sat_lnk_usercustomer'
src_ldts: 'dv_load_timestamp'
src_source: 'dv_recordsource'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.ma_sat(src_pk=metadata_dict['src_pk'],
                      src_cdk=metadata_dict['src_cdk'],
                      src_payload=metadata_dict['src_payload'],
                      src_hashdiff=metadata_dict['src_hashdiff'],
                      src_ldts=metadata_dict['src_ldts'],
                      src_source=metadata_dict['src_source'],
                      source_model=metadata_dict['source_model']) }}