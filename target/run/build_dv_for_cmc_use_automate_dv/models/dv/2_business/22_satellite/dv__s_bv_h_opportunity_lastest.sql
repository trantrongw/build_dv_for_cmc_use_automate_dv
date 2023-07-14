
    

    EXEC('create view "dbo"."dv__s_bv_h_opportunity_lastest__dbt_tmp" as SELECT a.*
    FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY T.dv_hash_key_h_opportunity
               ORDER BY T.dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_h_opportunity" T
            
    ) AS a
WHERE a.rank = 1 and a.Activate = 1;');

