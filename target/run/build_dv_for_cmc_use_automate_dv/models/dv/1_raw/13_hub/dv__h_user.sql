
      insert into "DWH"."dbo"."dv__h_user" ("dv_hash_key_h_user", "user_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_user", "user_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__h_user__dbt_tmp"
    )


  