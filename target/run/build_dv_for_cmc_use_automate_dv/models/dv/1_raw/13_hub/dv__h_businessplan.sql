
      insert into "DWH"."dbo"."dv__h_businessplan" ("dv_hash_key_h_businessplan", "businessplan_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_businessplan", "businessplan_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__h_businessplan__dbt_tmp"
    )


  