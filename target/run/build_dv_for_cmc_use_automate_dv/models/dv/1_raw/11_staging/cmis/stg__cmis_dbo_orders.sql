
    

    EXEC('create view "dbo"."stg__cmis_dbo_orders__dbt_tmp" as with source as (
      select * from "DWH"."dbo"."Staging__CMIS_dbo_Orders"
),
renamed as (
    select
        "ID",
        "Code",
        "Tag",
        "CustomerID",
        "TotalBeforeVAT",
        "ValueHardware",
        "TotalVAT",
        "TotalAfterVAT",
        "FileAttachments",
        "PublishType",
        "CreatedDate",
        "CreatedByID",
        "CreatedByName",
        "ModifiedDate",
        "ModifiedByID",
        "ModifiedByName",
        "IsPaymentGuarantee",
        "Activate",
        "RevenueSerial",
        "TimeContractSerial",
        "ProductName",
        "OpportunityID",
        "BOKinds",
        "RetailTypeID",
        "WarrantyID",
        "DV_RECORD_SOURCE",
        "DV_APPLIED_DATE"

    from source
)
select * from renamed;');

