SELECT a.*
FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_h_customer
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM {{ ref('dv__s_h_customer') }}
            
    ) AS a
WHERE a.rank = 1