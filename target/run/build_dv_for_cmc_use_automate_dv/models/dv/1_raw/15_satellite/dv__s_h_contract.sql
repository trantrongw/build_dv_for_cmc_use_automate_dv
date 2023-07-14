
      insert into "DWH"."dbo"."dv__s_h_contract" ("dv_hash_key_h_contract", "dv_hashdiff_s_h_contract", "Activate", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_contract", "dv_hashdiff_s_h_contract", "Activate", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_contract__dbt_tmp"
    )


  