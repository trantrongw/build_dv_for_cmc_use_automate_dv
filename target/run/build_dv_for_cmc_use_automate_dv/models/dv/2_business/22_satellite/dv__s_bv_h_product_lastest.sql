
    

    EXEC('create view "dbo"."dv__s_bv_h_product_lastest__dbt_tmp" as SELECT a.*
FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_h_product
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_h_product"
            
    ) AS a
WHERE a.rank = 1;');

