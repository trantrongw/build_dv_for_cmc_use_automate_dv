
      insert into "DWH"."dbo"."dv__h_opportunity" ("dv_hash_key_h_opportunity", "opportunity_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_opportunity", "opportunity_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__h_opportunity__dbt_tmp"
    )


  