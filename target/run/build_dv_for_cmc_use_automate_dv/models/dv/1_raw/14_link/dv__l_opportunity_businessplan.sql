
      insert into "DWH"."dbo"."dv__l_opportunity_businessplan" ("dv_hash_key_l_opportunity_businessplan", "dv_hash_key_h_opportunity", "dv_hash_key_h_businessplan", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_opportunity_businessplan", "dv_hash_key_h_opportunity", "dv_hash_key_h_businessplan", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__l_opportunity_businessplan__dbt_tmp"
    )


  