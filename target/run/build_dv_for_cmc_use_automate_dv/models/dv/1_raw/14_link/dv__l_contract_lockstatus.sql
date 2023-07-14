
      insert into "DWH"."dbo"."dv__l_contract_lockstatus" ("dv_hash_key_l_contract_lockstatus", "dv_hash_key_h_contract", "dv_cdk_s_l_contract_lockstatus", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_contract_lockstatus", "dv_hash_key_h_contract", "dv_cdk_s_l_contract_lockstatus", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__l_contract_lockstatus__dbt_tmp"
    )


  