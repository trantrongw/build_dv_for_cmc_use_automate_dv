
      insert into "DWH"."dbo"."dv__s_l_orderdetail" ("dv_hash_key_l_orderdetail", "dv_hashdiff_s_l_orderdetail", "TotalBeforeVAT", "IsMain", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_orderdetail", "dv_hashdiff_s_l_orderdetail", "TotalBeforeVAT", "IsMain", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_l_orderdetail__dbt_tmp"
    )


  