
      insert into "DWH"."dbo"."dv__h_order" ("dv_hash_key_h_order", "order_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_order", "order_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__h_order__dbt_tmp"
    )


  