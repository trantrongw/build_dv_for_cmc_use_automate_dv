
      insert into "DWH"."dbo"."dv__s_h_estimatecontract" ("dv_hash_key_h_estimatecontract", "dv_hashdiff_s_h_estimatecontract", "Profit", "Status", "Activate", "IsDeleted", "PublishType", "WFIsFinish", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_estimatecontract", "dv_hashdiff_s_h_estimatecontract", "Profit", "Status", "Activate", "IsDeleted", "PublishType", "WFIsFinish", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_estimatecontract__dbt_tmp"
    )


  