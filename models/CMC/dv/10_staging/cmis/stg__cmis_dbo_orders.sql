with source as (
      select * from {{ source('DWH', 'Staging__CMIS_dbo_Orders') }}
),
renamed as (
    select
        {{ adapter.quote("ID") }},
        {{ adapter.quote("Code") }},
        {{ adapter.quote("Tag") }},
        {{ adapter.quote("CustomerID") }},
        {{ adapter.quote("TotalBeforeVAT") }},
        {{ adapter.quote("ValueHardware") }},
        {{ adapter.quote("TotalVAT") }},
        {{ adapter.quote("TotalAfterVAT") }},
        {{ adapter.quote("FileAttachments") }},
        {{ adapter.quote("PublishType") }},
        {{ adapter.quote("CreatedDate") }},
        {{ adapter.quote("CreatedByID") }},
        {{ adapter.quote("CreatedByName") }},
        {{ adapter.quote("ModifiedDate") }},
        {{ adapter.quote("ModifiedByID") }},
        {{ adapter.quote("ModifiedByName") }},
        {{ adapter.quote("IsPaymentGuarantee") }},
        {{ adapter.quote("Activate") }},
        {{ adapter.quote("RevenueSerial") }},
        {{ adapter.quote("TimeContractSerial") }},
        {{ adapter.quote("ProductName") }},
        {{ adapter.quote("OpportunityID") }},
        {{ adapter.quote("BOKinds") }},
        {{ adapter.quote("RetailTypeID") }},
        {{ adapter.quote("WarrantyID") }},
        {{ adapter.quote("DV_RECORD_SOURCE") }},
        {{ adapter.quote("DV_APPLIED_DATE") }}

    from source
)
select * from renamed
  