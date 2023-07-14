
      insert into "DWH"."dbo"."dv__l_orderdetail" ("dv_hash_key_l_orderdetail", "dv_hash_key_h_order", "dv_hash_key_h_product", "dv_cdk_l_orderdetail", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_orderdetail", "dv_hash_key_h_order", "dv_hash_key_h_product", "dv_cdk_l_orderdetail", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__l_orderdetail__dbt_tmp"
    )


  