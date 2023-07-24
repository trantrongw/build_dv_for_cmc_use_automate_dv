{%- set yaml_metadata -%}
source_model: dv__h_opportunity
src_pk: dv_hash_key_h_opportunity
as_of_dates_table: as_of_dates
satellites: 
  dv__s_h_opportunity:
    pk:
      PK: dv_hash_key_h_opportunity
    ldts:
      LDTS: dv_load_timestamp
stage_tables_ldts: 
  hash__cmis_dbo_opportunities: dv_load_timestamp
src_ldts: dv_load_timestamp
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.pit(source_model=metadata_dict['source_model'], 
                   src_pk=metadata_dict['src_pk'],
                   as_of_dates_table=metadata_dict['as_of_dates_table'],
                   satellites=metadata_dict['satellites'],
                   stage_tables_ldts=metadata_dict['stage_tables_ldts'],
                   src_ldts=metadata_dict['src_ldts']) }}