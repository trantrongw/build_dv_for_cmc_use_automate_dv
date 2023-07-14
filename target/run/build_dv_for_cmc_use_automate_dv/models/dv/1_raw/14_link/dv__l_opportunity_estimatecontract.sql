
      insert into "DWH"."dbo"."dv__l_opportunity_estimatecontract" ("dv_hash_key_l_opportunity_estimatecontract", "dv_hash_key_h_opportunity", "dv_hash_key_h_estimatecontract", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_opportunity_estimatecontract", "dv_hash_key_h_opportunity", "dv_hash_key_h_estimatecontract", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__l_opportunity_estimatecontract__dbt_tmp"
    )


  