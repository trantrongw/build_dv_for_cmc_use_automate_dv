
      insert into "DWH"."dbo"."dv__s_h_order" ("dv_hash_key_h_order", "dv_hashdiff_s_h_order", "Activate", "CreatedDate", "TotalBeforeVAT", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_order", "dv_hashdiff_s_h_order", "Activate", "CreatedDate", "TotalBeforeVAT", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_order__dbt_tmp"
    )


  