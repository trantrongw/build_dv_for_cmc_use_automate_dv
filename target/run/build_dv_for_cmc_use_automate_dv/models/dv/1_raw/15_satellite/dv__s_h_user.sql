
      insert into "DWH"."dbo"."dv__s_h_user" ("dv_hash_key_h_user", "dv_hashdiff_s_h_user", "ID", "FirstName", "LastName", "EmployeeCode", "Gender", "Active", "BeginWorkDate", "TitleID", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_user", "dv_hashdiff_s_h_user", "ID", "FirstName", "LastName", "EmployeeCode", "Gender", "Active", "BeginWorkDate", "TitleID", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_user__dbt_tmp"
    )


  