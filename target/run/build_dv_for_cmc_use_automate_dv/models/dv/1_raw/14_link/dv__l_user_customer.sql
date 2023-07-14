
      insert into "DWH"."dbo"."dv__l_user_customer" ("dv_hash_key_l_user_customer", "dv_hash_key_h_user", "dv_hash_key_h_customer", "dv_cdk_l_user_customer", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_user_customer", "dv_hash_key_h_user", "dv_hash_key_h_customer", "dv_cdk_l_user_customer", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__l_user_customer__dbt_tmp"
    )


  