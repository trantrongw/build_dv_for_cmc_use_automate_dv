SELECT a.*
FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_l_opportunity_invoice
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM {{ ref('dv__s_l_opportunity_invoice') }}
            
    ) AS a
WHERE a.rank = 1