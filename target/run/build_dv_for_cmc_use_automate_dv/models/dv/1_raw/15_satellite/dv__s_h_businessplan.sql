
      insert into "DWH"."dbo"."dv__s_h_businessplan" ("dv_hash_key_h_businessplan", "dv_hashdiff_s_h_businessplan", "Profit", "Activate", "PublishType", "WFIsFinish", "IsDeleted", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_businessplan", "dv_hashdiff_s_h_businessplan", "Profit", "Activate", "PublishType", "WFIsFinish", "IsDeleted", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_businessplan__dbt_tmp"
    )


  