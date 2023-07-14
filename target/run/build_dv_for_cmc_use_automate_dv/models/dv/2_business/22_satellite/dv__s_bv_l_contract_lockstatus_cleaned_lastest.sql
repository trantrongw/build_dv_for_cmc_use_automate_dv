
    

    EXEC('create view "dbo"."dv__s_bv_l_contract_lockstatus_cleaned_lastest__dbt_tmp" as SELECT a.*
FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_l_contract_lockstatus
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_l_contract_lockstatus"
            
    ) AS a
WHERE a.rank = 1 and IsLock = 1  and ID <> ''41344'';');
