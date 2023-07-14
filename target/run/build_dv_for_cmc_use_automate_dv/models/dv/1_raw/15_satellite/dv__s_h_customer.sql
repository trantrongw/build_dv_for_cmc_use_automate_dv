
      insert into "DWH"."dbo"."dv__s_h_customer" ("dv_hash_key_h_customer", "dv_hashdiff_s_h_customer", "Name", "Address", "Phone", "Email", "CustomerTypeID", "IndustryTypeID", "EnvironmentTypeID", "ParentID", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_customer", "dv_hashdiff_s_h_customer", "Name", "Address", "Phone", "Email", "CustomerTypeID", "IndustryTypeID", "EnvironmentTypeID", "ParentID", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_customer__dbt_tmp"
    )


  