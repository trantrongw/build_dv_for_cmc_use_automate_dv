
      insert into "DWH"."dbo"."dv__s_h_product" ("dv_hash_key_h_product", "dv_hashdiff_s_h_product", "Code", "Name", "Description", "Activate", "IsDeleted", "ParentID", "ADN", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_product", "dv_hashdiff_s_h_product", "Code", "Name", "Description", "Activate", "IsDeleted", "ParentID", "ADN", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_product__dbt_tmp"
    )


  