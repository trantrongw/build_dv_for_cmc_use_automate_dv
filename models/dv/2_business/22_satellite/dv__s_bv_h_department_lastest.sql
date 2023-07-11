SELECT a.*
    FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY T.dv_hash_key_h_department
               ORDER BY T.dv_load_timestamp DESC
            ) AS rank
        FROM {{ ref('dv__s_h_department') }} T
            
    ) AS a
WHERE a.rank = 1 