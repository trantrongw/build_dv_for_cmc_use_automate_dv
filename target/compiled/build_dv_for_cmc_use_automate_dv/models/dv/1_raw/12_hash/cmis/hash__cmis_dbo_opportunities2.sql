
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    ID,
    Code,
    CustomerID,
    SaleManID,
    OpportunityType,
    GroupID,
    EstimateRevenue,
    Description,
    StatusID,
    PublishType,
    Activate,
    IsDeleted,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    ModifiedDate,
    ModifiedByID,
    ModifiedByName,
    ParentID,
    BusinessOpportunityID,
    CustomerName,
    BaseSource,
    LastUpdateBase,
    ParentIndex,
    IsParent,
    IsLockFinance,
    ExpiryDate,
    FinancialYear,
    CustomerCode,
    SaleManUserName,
    SaleManFullName,
    GroupCode,
    GroupName,
    EstimateRevenueExist,
    Common,
    ProductManagerID,
    ProductManagerUserName,
    ProductManagerFullName,
    IsFinish,
    BoxmovingType,
    OrderID,
    Url,
    IsSync,
    DateSync,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE

    FROM "DWH"."dbo"."stg__cmis_dbo_opportunities"
),

derived_columns AS (

    SELECT

    ID,
    Code,
    CustomerID,
    SaleManID,
    OpportunityType,
    GroupID,
    EstimateRevenue,
    Description,
    StatusID,
    PublishType,
    Activate,
    IsDeleted,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    ModifiedDate,
    ModifiedByID,
    ModifiedByName,
    ParentID,
    BusinessOpportunityID,
    CustomerName,
    BaseSource,
    LastUpdateBase,
    ParentIndex,
    IsParent,
    IsLockFinance,
    ExpiryDate,
    FinancialYear,
    CustomerCode,
    SaleManUserName,
    SaleManFullName,
    GroupCode,
    GroupName,
    EstimateRevenueExist,
    Common,
    ProductManagerID,
    ProductManagerUserName,
    ProductManagerFullName,
    IsFinish,
    BoxmovingType,
    OrderID,
    Url,
    IsSync,
    DateSync,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    DV_RECORD_SOURCE AS dv_recordsource,
    cast( DV_APPLIED_DATE as DATETIME2(6)) AS dv_load_timestamp,
    cast(Code as VARCHAR(8000)) AS opportunity_code,
    'default' AS dv_tenant_id,
    'default' AS dv_collisioncode

    FROM source_data
),

hashed_columns AS (

    SELECT

    ID,
    Code,
    CustomerID,
    SaleManID,
    OpportunityType,
    GroupID,
    EstimateRevenue,
    Description,
    StatusID,
    PublishType,
    Activate,
    IsDeleted,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    ModifiedDate,
    ModifiedByID,
    ModifiedByName,
    ParentID,
    BusinessOpportunityID,
    CustomerName,
    BaseSource,
    LastUpdateBase,
    ParentIndex,
    IsParent,
    IsLockFinance,
    ExpiryDate,
    FinancialYear,
    CustomerCode,
    SaleManUserName,
    SaleManFullName,
    GroupCode,
    GroupName,
    EstimateRevenueExist,
    Common,
    ProductManagerID,
    ProductManagerUserName,
    ProductManagerFullName,
    IsFinish,
    BoxmovingType,
    OrderID,
    Url,
    IsSync,
    DateSync,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    dv_recordsource,
    dv_load_timestamp,
    opportunity_code,
    dv_tenant_id,
    dv_collisioncode,

    CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(opportunity_code AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^')), 2) AS dv_hash_key_h_opportunity,

    CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(ID AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(Code AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^||^^')), 2) AS dv_hash_key_l_opportunity_sa,

    CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(Code AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^')), 2) AS dv_master_hash_key_h_opportunity,

    CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(ID AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^')), 2) AS dv_duplicate_hash_key_h_opportunity

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    ID,
    Code,
    CustomerID,
    SaleManID,
    OpportunityType,
    GroupID,
    EstimateRevenue,
    Description,
    StatusID,
    PublishType,
    Activate,
    IsDeleted,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    ModifiedDate,
    ModifiedByID,
    ModifiedByName,
    ParentID,
    BusinessOpportunityID,
    CustomerName,
    BaseSource,
    LastUpdateBase,
    ParentIndex,
    IsParent,
    IsLockFinance,
    ExpiryDate,
    FinancialYear,
    CustomerCode,
    SaleManUserName,
    SaleManFullName,
    GroupCode,
    GroupName,
    EstimateRevenueExist,
    Common,
    ProductManagerID,
    ProductManagerUserName,
    ProductManagerFullName,
    IsFinish,
    BoxmovingType,
    OrderID,
    Url,
    IsSync,
    DateSync,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    dv_recordsource,
    dv_load_timestamp,
    opportunity_code,
    dv_tenant_id,
    dv_collisioncode,
    dv_hash_key_h_opportunity,
    dv_hash_key_l_opportunity_sa,
    dv_master_hash_key_h_opportunity,
    dv_duplicate_hash_key_h_opportunity

    FROM hashed_columns
)

SELECT * FROM columns_to_select