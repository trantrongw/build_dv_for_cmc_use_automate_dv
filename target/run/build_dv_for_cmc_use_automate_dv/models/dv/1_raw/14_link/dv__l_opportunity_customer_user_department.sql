
      insert into "DWH"."dbo"."dv__l_opportunity_customer_user_department" ("dv_hash_key_l_opportunity_customer_user_department", "dv_hash_key_h_opportunity", "dv_hash_key_h_customer", "dv_hash_key_h_user", "dv_hash_key_h_department", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_opportunity_customer_user_department", "dv_hash_key_h_opportunity", "dv_hash_key_h_customer", "dv_hash_key_h_user", "dv_hash_key_h_department", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__l_opportunity_customer_user_department__dbt_tmp"
    )


  