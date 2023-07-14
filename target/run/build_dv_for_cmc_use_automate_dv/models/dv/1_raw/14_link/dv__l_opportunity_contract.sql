
      insert into "DWH"."dbo"."dv__l_opportunity_contract" ("dv_hash_key_l_opportunity_contract", "dv_hash_key_h_opportunity", "dv_hash_key_h_contract", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_opportunity_contract", "dv_hash_key_h_opportunity", "dv_hash_key_h_contract", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__l_opportunity_contract__dbt_tmp"
    )


  