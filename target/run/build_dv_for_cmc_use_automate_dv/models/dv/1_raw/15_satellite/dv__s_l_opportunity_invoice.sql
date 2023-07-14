
      insert into "DWH"."dbo"."dv__s_l_opportunity_invoice" ("dv_hash_key_l_opportunity_invoice", "dv_hashdiff_s_l_opportunity_invoice", "ngay_ct", "ps_co", "ps_no", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_l_opportunity_invoice", "dv_hashdiff_s_l_opportunity_invoice", "ngay_ct", "ps_co", "ps_no", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_l_opportunity_invoice__dbt_tmp"
    )


  