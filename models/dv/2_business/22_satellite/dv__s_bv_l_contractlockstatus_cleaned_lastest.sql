SELECT a.*
FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_l_contract_lockstatus
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM {{ ref('dv__s_l_contract_lockstatus') }}
            
    ) AS a
WHERE a.rank = 1 and IsLock = 1 