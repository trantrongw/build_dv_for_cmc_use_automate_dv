
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    ID,
    ContractID,
    TotalBeforeVAT,
    TotalVAT,
    TotalAfterVAT,
    Content,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    Total,
    LockType,
    LockDate,
    LockTypeName,
    Nam_TC,
    IsLock,
    LockUserName,
    AdditionalTerm,
    TotalLockVAT,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE

    FROM "DWH"."dbo"."stg__cmis_dbo_contractlockstatus"
),

derived_columns AS (

    SELECT

    ID,
    ContractID,
    TotalBeforeVAT,
    TotalVAT,
    TotalAfterVAT,
    Content,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    Total,
    LockType,
    LockDate,
    LockTypeName,
    Nam_TC,
    IsLock,
    LockUserName,
    AdditionalTerm,
    TotalLockVAT,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    DV_RECORD_SOURCE AS dv_recordsource,
    cast( DV_APPLIED_DATE as DATETIME2(6)) AS dv_load_timestamp,
    cast([ContractID] as VARCHAR(8000)) AS contract_code,
    cast([ID] as VARCHAR(8000)) AS dv_cdk_s_l_contract_lockstatus,
    'default' AS dv_tenant_id,
    'default' AS dv_collisioncode

    FROM source_data
),

hashed_columns AS (

    SELECT

    ID,
    ContractID,
    TotalBeforeVAT,
    TotalVAT,
    TotalAfterVAT,
    Content,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    Total,
    LockType,
    LockDate,
    LockTypeName,
    Nam_TC,
    IsLock,
    LockUserName,
    AdditionalTerm,
    TotalLockVAT,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    dv_recordsource,
    dv_load_timestamp,
    contract_code,
    dv_cdk_s_l_contract_lockstatus,
    dv_tenant_id,
    dv_collisioncode,

    CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(contract_code AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^')), 2) AS dv_hash_key_h_contract,

    CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(contract_code AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_cdk_s_l_contract_lockstatus AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^||^^')), 2) AS dv_hash_key_l_contract_lockstatus,

    CONVERT(CHAR(32), HASHBYTES('MD5', CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST([ID] AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST([IsLock] AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST([LockDate] AS VARCHAR(MAX)))), ''), '^^')
    )), 2) AS dv_hashdiff_s_l_contract_lockstatus

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    ID,
    ContractID,
    TotalBeforeVAT,
    TotalVAT,
    TotalAfterVAT,
    Content,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    Total,
    LockType,
    LockDate,
    LockTypeName,
    Nam_TC,
    IsLock,
    LockUserName,
    AdditionalTerm,
    TotalLockVAT,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    dv_recordsource,
    dv_load_timestamp,
    contract_code,
    dv_cdk_s_l_contract_lockstatus,
    dv_tenant_id,
    dv_collisioncode,
    dv_hash_key_h_contract,
    dv_hash_key_l_contract_lockstatus,
    dv_hashdiff_s_l_contract_lockstatus

    FROM hashed_columns
)

SELECT * FROM columns_to_select