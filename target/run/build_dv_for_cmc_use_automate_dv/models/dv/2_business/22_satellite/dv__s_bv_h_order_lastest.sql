
    

    EXEC('create view "dbo"."dv__s_bv_h_order_lastest__dbt_tmp" as SELECT a.*
FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_h_order
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_h_order"
            
    ) AS a
WHERE a.rank = 1 and a.Activate = 1;');

