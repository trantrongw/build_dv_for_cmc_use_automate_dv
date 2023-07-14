
      insert into "DWH"."dbo"."dv__s_l_user_customer_rt" ("dv_hash_key_l_user_customer", "dv_hashdiff_s_l_user_customer_rt", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_user_customer", "dv_hashdiff_s_l_user_customer_rt", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_l_user_customer_rt__dbt_tmp"
    )


  