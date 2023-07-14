
      insert into "DWH"."dbo"."dv__s_h_finalizationcontract" ("dv_hash_key_h_finalizationcontract", "dv_hashdiff_s_h_finalizationcontract", "Profit", "Activate", "PublishType", "WFIsFinish", "IsDeleted", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_finalizationcontract", "dv_hashdiff_s_h_finalizationcontract", "Profit", "Activate", "PublishType", "WFIsFinish", "IsDeleted", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_finalizationcontract__dbt_tmp"
    )


  