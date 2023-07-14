
  
    
   
   
    

    EXEC('create view "dbo"."hash__cmis_dbo_businessplans__dbt_tmp_temp_view" as 
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    ID,
    OpportunityID,
    Code,
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
    GroupID,
    UserID,
    PaymentType,
    RevenueNow,
    RevenueDebt,
    RewardFromSupplier,
    ProductPrice,
    RentPrice,
    WarrantyVATPrice,
    WarrantyExtPrice,
    SupplierPrice,
    LicensePrice,
    MaterialPrice,
    MaterialOtherPrice,
    ConsultantPrice,
    DeploymentPrice,
    WarrantyPaymentPrice,
    ProfitLender,
    FinancialIncome,
    ConsultantManday,
    DeloymentManday,
    MarketingPrice,
    OtherPrice,
    Revenue,
    VariableCost,
    Cost,
    TotalMaterialCost,
    TotalOtherMaterialCost,
    CostByMoney,
    WarrantyDetailCost,
    TotalWarrantyPaymentPrice,
    Profit,
    TotalPrice,
    TotalFinancial,
    TotalManday,
    TotalMarketing,
    TotalOhters,
    TotalProfit,
    ProviderReward,
    WFIsFinish,
    WFStatusName,
    WFProcessByID,
    WFProcessByName,
    Version,
    BaseSource,
    LastUpdateBase,
    IsConfirmFile,
    LeaseServiceCost,
    TotalLeaseServiceCost,
    IsCustomerPeersSI,
    TotalWarrantyBHUQPrice,
    WarrantyPaymentPrice8x5,
    WarrantyPaymentPrice24x7,
    WarrantyPriceIncrease,
    WarrantyPriceExtend,
    WFFinishDate,
    DeadlineDate,
    ProductPriceDomestic,
    ProductPriceForeign,
    RateRisk,
    OpportunityCode,
    IsITSOrBSGB,
    IsRetail,
    OrtherOpportunityType,
    GroupADN,
    ProductTotalBeforeVAT,
    ProductTotalVAT,
    ProductTotalAfterVAT,
    HaveProduct,
    HaveAdvancePayment,
    HaveDeployDelivery,
    RetailTypeID,
    TechnologicalCapability,
    ProjectReward,
    Url,
    IsSync,
    DateSync,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE

    FROM "DWH"."dbo"."stg__cmis_dbo_businessplans"
),

derived_columns AS (

    SELECT

    ID,
    OpportunityID,
    Code,
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
    GroupID,
    UserID,
    PaymentType,
    RevenueNow,
    RevenueDebt,
    RewardFromSupplier,
    ProductPrice,
    RentPrice,
    WarrantyVATPrice,
    WarrantyExtPrice,
    SupplierPrice,
    LicensePrice,
    MaterialPrice,
    MaterialOtherPrice,
    ConsultantPrice,
    DeploymentPrice,
    WarrantyPaymentPrice,
    ProfitLender,
    FinancialIncome,
    ConsultantManday,
    DeloymentManday,
    MarketingPrice,
    OtherPrice,
    Revenue,
    VariableCost,
    Cost,
    TotalMaterialCost,
    TotalOtherMaterialCost,
    CostByMoney,
    WarrantyDetailCost,
    TotalWarrantyPaymentPrice,
    Profit,
    TotalPrice,
    TotalFinancial,
    TotalManday,
    TotalMarketing,
    TotalOhters,
    TotalProfit,
    ProviderReward,
    WFIsFinish,
    WFStatusName,
    WFProcessByID,
    WFProcessByName,
    Version,
    BaseSource,
    LastUpdateBase,
    IsConfirmFile,
    LeaseServiceCost,
    TotalLeaseServiceCost,
    IsCustomerPeersSI,
    TotalWarrantyBHUQPrice,
    WarrantyPaymentPrice8x5,
    WarrantyPaymentPrice24x7,
    WarrantyPriceIncrease,
    WarrantyPriceExtend,
    WFFinishDate,
    DeadlineDate,
    ProductPriceDomestic,
    ProductPriceForeign,
    RateRisk,
    OpportunityCode,
    IsITSOrBSGB,
    IsRetail,
    OrtherOpportunityType,
    GroupADN,
    ProductTotalBeforeVAT,
    ProductTotalVAT,
    ProductTotalAfterVAT,
    HaveProduct,
    HaveAdvancePayment,
    HaveDeployDelivery,
    RetailTypeID,
    TechnologicalCapability,
    ProjectReward,
    Url,
    IsSync,
    DateSync,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    DV_RECORD_SOURCE AS dv_recordsource,
    cast( DV_APPLIED_DATE as DATETIME2(6)) AS dv_load_timestamp,
    cast([OpportunityID] as VARCHAR(8000)) AS opportunity_code,
    cast([ID] as VARCHAR(8000)) AS businessplan_code,
    ''default'' AS dv_tenant_id,
    ''default'' AS dv_collisioncode

    FROM source_data
),

hashed_columns AS (

    SELECT

    ID,
    OpportunityID,
    Code,
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
    GroupID,
    UserID,
    PaymentType,
    RevenueNow,
    RevenueDebt,
    RewardFromSupplier,
    ProductPrice,
    RentPrice,
    WarrantyVATPrice,
    WarrantyExtPrice,
    SupplierPrice,
    LicensePrice,
    MaterialPrice,
    MaterialOtherPrice,
    ConsultantPrice,
    DeploymentPrice,
    WarrantyPaymentPrice,
    ProfitLender,
    FinancialIncome,
    ConsultantManday,
    DeloymentManday,
    MarketingPrice,
    OtherPrice,
    Revenue,
    VariableCost,
    Cost,
    TotalMaterialCost,
    TotalOtherMaterialCost,
    CostByMoney,
    WarrantyDetailCost,
    TotalWarrantyPaymentPrice,
    Profit,
    TotalPrice,
    TotalFinancial,
    TotalManday,
    TotalMarketing,
    TotalOhters,
    TotalProfit,
    ProviderReward,
    WFIsFinish,
    WFStatusName,
    WFProcessByID,
    WFProcessByName,
    Version,
    BaseSource,
    LastUpdateBase,
    IsConfirmFile,
    LeaseServiceCost,
    TotalLeaseServiceCost,
    IsCustomerPeersSI,
    TotalWarrantyBHUQPrice,
    WarrantyPaymentPrice8x5,
    WarrantyPaymentPrice24x7,
    WarrantyPriceIncrease,
    WarrantyPriceExtend,
    WFFinishDate,
    DeadlineDate,
    ProductPriceDomestic,
    ProductPriceForeign,
    RateRisk,
    OpportunityCode,
    IsITSOrBSGB,
    IsRetail,
    OrtherOpportunityType,
    GroupADN,
    ProductTotalBeforeVAT,
    ProductTotalVAT,
    ProductTotalAfterVAT,
    HaveProduct,
    HaveAdvancePayment,
    HaveDeployDelivery,
    RetailTypeID,
    TechnologicalCapability,
    ProjectReward,
    Url,
    IsSync,
    DateSync,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    dv_recordsource,
    dv_load_timestamp,
    opportunity_code,
    businessplan_code,
    dv_tenant_id,
    dv_collisioncode,

    CONVERT(CHAR(32), HASHBYTES(''MD5'', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST(opportunity_code AS VARCHAR(MAX)))), ''''), ''^^'')
    ), ''^^||^^||^^'')), 2) AS dv_hash_key_h_opportunity,

    CONVERT(CHAR(32), HASHBYTES(''MD5'', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST(businessplan_code AS VARCHAR(MAX)))), ''''), ''^^'')
    ), ''^^||^^||^^'')), 2) AS dv_hash_key_h_businessplan,

    CONVERT(CHAR(32), HASHBYTES(''MD5'', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_tenant_id AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST(dv_collisioncode AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST(opportunity_code AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST(businessplan_code AS VARCHAR(MAX)))), ''''), ''^^'')
    ), ''^^||^^||^^||^^'')), 2) AS dv_hash_key_l_opportunity_businessplan,

    CONVERT(CHAR(32), HASHBYTES(''MD5'', CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST([Activate] AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST([IsDeleted] AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST([Profit] AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST([PublishType] AS VARCHAR(MAX)))), ''''), ''^^''), ''||'',
        ISNULL(NULLIF(UPPER(TRIM(CAST([WFIsFinish] AS VARCHAR(MAX)))), ''''), ''^^'')
    )), 2) AS dv_hashdiff_s_h_businessplan

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    ID,
    OpportunityID,
    Code,
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
    GroupID,
    UserID,
    PaymentType,
    RevenueNow,
    RevenueDebt,
    RewardFromSupplier,
    ProductPrice,
    RentPrice,
    WarrantyVATPrice,
    WarrantyExtPrice,
    SupplierPrice,
    LicensePrice,
    MaterialPrice,
    MaterialOtherPrice,
    ConsultantPrice,
    DeploymentPrice,
    WarrantyPaymentPrice,
    ProfitLender,
    FinancialIncome,
    ConsultantManday,
    DeloymentManday,
    MarketingPrice,
    OtherPrice,
    Revenue,
    VariableCost,
    Cost,
    TotalMaterialCost,
    TotalOtherMaterialCost,
    CostByMoney,
    WarrantyDetailCost,
    TotalWarrantyPaymentPrice,
    Profit,
    TotalPrice,
    TotalFinancial,
    TotalManday,
    TotalMarketing,
    TotalOhters,
    TotalProfit,
    ProviderReward,
    WFIsFinish,
    WFStatusName,
    WFProcessByID,
    WFProcessByName,
    Version,
    BaseSource,
    LastUpdateBase,
    IsConfirmFile,
    LeaseServiceCost,
    TotalLeaseServiceCost,
    IsCustomerPeersSI,
    TotalWarrantyBHUQPrice,
    WarrantyPaymentPrice8x5,
    WarrantyPaymentPrice24x7,
    WarrantyPriceIncrease,
    WarrantyPriceExtend,
    WFFinishDate,
    DeadlineDate,
    ProductPriceDomestic,
    ProductPriceForeign,
    RateRisk,
    OpportunityCode,
    IsITSOrBSGB,
    IsRetail,
    OrtherOpportunityType,
    GroupADN,
    ProductTotalBeforeVAT,
    ProductTotalVAT,
    ProductTotalAfterVAT,
    HaveProduct,
    HaveAdvancePayment,
    HaveDeployDelivery,
    RetailTypeID,
    TechnologicalCapability,
    ProjectReward,
    Url,
    IsSync,
    DateSync,
    DV_RECORD_SOURCE,
    DV_APPLIED_DATE,
    dv_recordsource,
    dv_load_timestamp,
    opportunity_code,
    businessplan_code,
    dv_tenant_id,
    dv_collisioncode,
    dv_hash_key_h_opportunity,
    dv_hash_key_h_businessplan,
    dv_hash_key_l_opportunity_businessplan,
    dv_hashdiff_s_h_businessplan

    FROM hashed_columns
)

SELECT * FROM columns_to_select;');


   EXEC('CREATE TABLE "dbo"."hash__cmis_dbo_businessplans__dbt_tmp" AS (SELECT * FROM "dbo"."hash__cmis_dbo_businessplans__dbt_tmp_temp_view");');
   
    
    

    
    

    
    

    EXEC('DROP view IF EXISTS "dbo"."hash__cmis_dbo_businessplans__dbt_tmp_temp_view";');




  