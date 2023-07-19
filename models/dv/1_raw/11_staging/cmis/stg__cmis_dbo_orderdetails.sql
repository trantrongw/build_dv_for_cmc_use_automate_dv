with source as (
      select * from {{ source('DWH', 'Staging__CMIS_dbo_OrderDetails') }}
),
renamed as (
    select
        {{ adapter.quote("ID") }},
        {{ adapter.quote("Code") }},
        {{ adapter.quote("OrderID") }},
        {{ adapter.quote("OrderCode") }},
        {{ adapter.quote("SolutionBranchID") }},
        {{ adapter.quote("SolutionBranchNameID") }},
        {{ adapter.quote("ProductBranchID") }},
        {{ adapter.quote("VendorBranchID") }},
        {{ adapter.quote("ProductName") }},
        {{ adapter.quote("VATTypeID") }},
        {{ adapter.quote("PartNumber") }},
        {{ adapter.quote("Warranty") }},
        {{ adapter.quote("BeginDateWarranty") }},
        {{ adapter.quote("EndDateWarranty") }},
        {{ adapter.quote("Description") }},
        {{ adapter.quote("UnitName") }},
        {{ adapter.quote("Quantity") }},
        {{ adapter.quote("Tax") }},
        {{ adapter.quote("Price") }},
        {{ adapter.quote("TotalBeforeVAT") }},
        {{ adapter.quote("TotalVAT") }},
        {{ adapter.quote("TotalAfterVAT") }},
        {{ adapter.quote("CreatedDate") }},
        {{ adapter.quote("NameSolutionBranchID") }},
        {{ adapter.quote("NameSolutionBranchNameID") }},
        {{ adapter.quote("NameProductBranchID") }},
        {{ adapter.quote("NameVendorBranchID") }},
        {{ adapter.quote("NameVATTypeID") }},
        {{ adapter.quote("RetailTypeID") }},
        {{ adapter.quote("RetailConfigID") }},
        {{ adapter.quote("IsService") }},
        {{ adapter.quote("IsHardware") }},
        {{ adapter.quote("STTMis") }},
        {{ adapter.quote("GroupID") }},
        {{ adapter.quote("IsMain") }},
        {{ adapter.quote("ParentID") }},
        {{ adapter.quote("dv_record_source") }},
        {{ adapter.quote("dv_applied_date") }}

    from source
)
select * from renamed
  