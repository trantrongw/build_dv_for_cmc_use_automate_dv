
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    ID,
    OpportunityID,
    Code,
    UserID,
    GroupID,
    Description,
    Activate,
    IsDeleted,
    PublishType,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    ModifiedDate,
    ModifiedByID,
    ModifiedByName,
    FileAttachments,
    BusinessPlanID,
    EstimateContractID,
    TotalPrice,
    WFIsFinish,
    WFStatusName,
    WFProcessByID,
    WFProcessByName,
    Version,
    BaseSource,
    LastUpdateBase,
    TotalPriceEstimate,
    Revenue,
    WareReturn,
    RevenueProfit,
    VariableCost,
    Cost,
    TotalWareReturn,
    TotalMaterialCost,
    TotalOtherMaterialCost,
    CostByMoney,
    WarrantyDetailCost,
    TotalWarrantyPaymentPrice,
    WarrantyBHUQ,
    Profit,
    TotalFinancial,
    TotalManday,
    TotalMarketing,
    TotalOhters,
    TotalProfit,
    FinalizationContractType,
    WFFinishDate,
    DeadlineDate,
    EstimateTotalPrice,
    OpportunityCode,
    GroupADN,
    FinanceYear,
    EnoughDate,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE

    FROM "DWH"."dbo"."stg__cmis_dbo_finalizationcontracts"
),

derived_columns AS (

    SELECT

    ID,
    OpportunityID,
    Code,
    UserID,
    GroupID,
    Description,
    Activate,
    IsDeleted,
    PublishType,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    ModifiedDate,
    ModifiedByID,
    ModifiedByName,
    FileAttachments,
    BusinessPlanID,
    EstimateContractID,
    TotalPrice,
    WFIsFinish,
    WFStatusName,
    WFProcessByID,
    WFProcessByName,
    Version,
    BaseSource,
    LastUpdateBase,
    TotalPriceEstimate,
    Revenue,
    WareReturn,
    RevenueProfit,
    VariableCost,
    Cost,
    TotalWareReturn,
    TotalMaterialCost,
    TotalOtherMaterialCost,
    CostByMoney,
    WarrantyDetailCost,
    TotalWarrantyPaymentPrice,
    WarrantyBHUQ,
    Profit,
    TotalFinancial,
    TotalManday,
    TotalMarketing,
    TotalOhters,
    TotalProfit,
    FinalizationContractType,
    WFFinishDate,
    DeadlineDate,
    EstimateTotalPrice,
    OpportunityCode,
    GroupADN,
    FinanceYear,
    EnoughDate,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    DV_RECORD_SOURCE AS dv_recordsource,
    cast( DV_APPLIED_DATE as DATETIME2(6)) AS dv_load_timestamp,
    cast([OpportunityID] as VARCHAR(8000)) AS opportunity_code,
    cast([ID] as VARCHAR(8000)) AS finalizationcontract_code,
    'default' AS dv_tenant_id,
    'default' AS dv_collisioncode

    FROM source_data
),

hashed_columns AS (

    SELECT

    ID,
    OpportunityID,
    Code,
    UserID,
    GroupID,
    Description,
    Activate,
    IsDeleted,
    PublishType,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    ModifiedDate,
    ModifiedByID,
    ModifiedByName,
    FileAttachments,
    BusinessPlanID,
    EstimateContractID,
    TotalPrice,
    WFIsFinish,
    WFStatusName,
    WFProcessByID,
    WFProcessByName,
    Version,
    BaseSource,
    LastUpdateBase,
    TotalPriceEstimate,
    Revenue,
    WareReturn,
    RevenueProfit,
    VariableCost,
    Cost,
    TotalWareReturn,
    TotalMaterialCost,
    TotalOtherMaterialCost,
    CostByMoney,
    WarrantyDetailCost,
    TotalWarrantyPaymentPrice,
    WarrantyBHUQ,
    Profit,
    TotalFinancial,
    TotalManday,
    TotalMarketing,
    TotalOhters,
    TotalProfit,
    FinalizationContractType,
    WFFinishDate,
    DeadlineDate,
    EstimateTotalPrice,
    OpportunityCode,
    GroupADN,
    FinanceYear,
    EnoughDate,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    dv_recordsource,
    dv_load_timestamp,
    opportunity_code,
    finalizationcontract_code,
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
        ISNULL(NULLIF(UPPER(TRIM(CAST(finalizationcontract_code AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^')), 2) AS dv_hash_key_h_finalizationcontract,

    CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(opportunity_code AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(finalizationcontract_code AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^||^^')), 2) AS dv_hash_key_l_opportunity_finalizationcontract,

    CONVERT(CHAR(32), HASHBYTES('MD5', CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST([Activate] AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST([FinalizationContractType] AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST([IsDeleted] AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST([ModifiedDate] AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST([Profit] AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST([PublishType] AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST([WFIsFinish] AS VARCHAR(MAX)))), ''), '^^')
    )), 2) AS dv_hashdiff_s_h_finalizationcontract

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    ID,
    OpportunityID,
    Code,
    UserID,
    GroupID,
    Description,
    Activate,
    IsDeleted,
    PublishType,
    CreatedDate,
    CreatedByID,
    CreatedByName,
    ModifiedDate,
    ModifiedByID,
    ModifiedByName,
    FileAttachments,
    BusinessPlanID,
    EstimateContractID,
    TotalPrice,
    WFIsFinish,
    WFStatusName,
    WFProcessByID,
    WFProcessByName,
    Version,
    BaseSource,
    LastUpdateBase,
    TotalPriceEstimate,
    Revenue,
    WareReturn,
    RevenueProfit,
    VariableCost,
    Cost,
    TotalWareReturn,
    TotalMaterialCost,
    TotalOtherMaterialCost,
    CostByMoney,
    WarrantyDetailCost,
    TotalWarrantyPaymentPrice,
    WarrantyBHUQ,
    Profit,
    TotalFinancial,
    TotalManday,
    TotalMarketing,
    TotalOhters,
    TotalProfit,
    FinalizationContractType,
    WFFinishDate,
    DeadlineDate,
    EstimateTotalPrice,
    OpportunityCode,
    GroupADN,
    FinanceYear,
    EnoughDate,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    dv_recordsource,
    dv_load_timestamp,
    opportunity_code,
    finalizationcontract_code,
    dv_tenant_id,
    dv_collisioncode,
    dv_hash_key_h_opportunity,
    dv_hash_key_h_finalizationcontract,
    dv_hash_key_l_opportunity_finalizationcontract,
    dv_hashdiff_s_h_finalizationcontract

    FROM hashed_columns
)

SELECT * FROM columns_to_select