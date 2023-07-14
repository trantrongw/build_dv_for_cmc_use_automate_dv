
      insert into "DWH"."dbo"."dv__h_invoice" ("dv_hash_key_h_invoice", "invoice_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_invoice", "invoice_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__h_invoice__dbt_tmp"
    )


  