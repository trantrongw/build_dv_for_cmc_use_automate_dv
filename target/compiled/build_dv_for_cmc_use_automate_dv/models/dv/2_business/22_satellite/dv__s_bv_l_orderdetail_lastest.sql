SELECT a.*
FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_l_orderdetail
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_l_orderdetail"
            
    ) AS a
WHERE a.rank = 1 and a.IsMain = 1