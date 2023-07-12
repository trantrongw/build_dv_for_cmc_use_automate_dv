SELECT a.*
FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_h_estimatecontract
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM {{ ref('dv__s_h_estimatecontract') }}
            
    ) AS a
WHERE a.rank = 1 and Activate = 1 and PublishType = 1 and WFIsFinish = 1