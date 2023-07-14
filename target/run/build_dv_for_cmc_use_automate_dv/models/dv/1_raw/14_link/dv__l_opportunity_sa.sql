
      insert into "DWH"."dbo"."dv__l_opportunity_sa" ("dv_hash_key_l_opportunity_sa", "dv_master_hash_key_h_opportunity", "dv_duplicate_hash_key_h_opportunity", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_opportunity_sa", "dv_master_hash_key_h_opportunity", "dv_duplicate_hash_key_h_opportunity", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__l_opportunity_sa__dbt_tmp"
    )


  