
      insert into "DWH"."dbo"."dv__s_l_contract_lockstatus" ("dv_hash_key_l_contract_lockstatus", "dv_hashdiff_s_l_contract_lockstatus", "IsLock", "LockDate", "ID", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_contract_lockstatus", "dv_hashdiff_s_l_contract_lockstatus", "IsLock", "LockDate", "ID", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_l_contract_lockstatus__dbt_tmp"
    )


  