
      insert into "DWH"."dbo"."dv__h_department" ("dv_hash_key_h_department", "department_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_department", "department_code", "dv_tenant_id", "dv_collisioncode", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__h_department__dbt_tmp"
    )


  