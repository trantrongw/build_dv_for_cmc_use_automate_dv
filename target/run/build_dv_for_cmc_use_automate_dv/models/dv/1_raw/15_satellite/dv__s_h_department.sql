
      insert into "DWH"."dbo"."dv__s_h_department" ("dv_hash_key_h_department", "dv_hashdiff_s_h_department", "ID", "GroupName", "GroupCode", "Year", "ParentID", "IsActive", "IsVirtual", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_department", "dv_hashdiff_s_h_department", "ID", "GroupName", "GroupCode", "Year", "ParentID", "IsActive", "IsVirtual", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_department__dbt_tmp"
    )


  