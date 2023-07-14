with source as (
      select * from "DWH"."dbo"."Staging__CMIS_dbo_OrderDetails"
),
renamed as (
    select
        "ID",
        "Code",
        "OrderID",
        "OrderCode",
        "SolutionBranchID",
        "SolutionBranchNameID",
        "ProductBranchID",
        "VendorBranchID",
        "ProductName",
        "VATTypeID",
        "PartNumber",
        "Warranty",
        "BeginDateWarranty",
        "EndDateWarranty",
        "Description",
        "UnitName",
        "Quantity",
        "Tax",
        "Price",
        "TotalBeforeVAT",
        "TotalVAT",
        "TotalAfterVAT",
        "CreatedDate",
        "NameSolutionBranchID",
        "NameSolutionBranchNameID",
        "NameProductBranchID",
        "NameVendorBranchID",
        "NameVATTypeID",
        "RetailTypeID",
        "RetailConfigID",
        "IsService",
        "IsHardware",
        "STTMis",
        "GroupID",
        "IsMain",
        "ParentID",
        "DV_RECORD_SOURCE",
        "DV_APPLIED_DATE"

    from source
)
select * from renamed