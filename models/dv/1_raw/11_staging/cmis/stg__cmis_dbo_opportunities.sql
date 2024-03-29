with source as (
      select 
      {% if target.name == 'dev' %} top 0 {% endif %}
      * 
      from {{ source('DWH', 'Staging__CMIS_dbo_Opportunities') }}
),
renamed as (
    select
        {{ adapter.quote("ID") }},
        {{ adapter.quote("Code") }},
        {{ adapter.quote("CustomerID") }},
        {{ adapter.quote("SaleManID") }},
        {{ adapter.quote("OpportunityType") }},
        {{ adapter.quote("GroupID") }},
        cast({{ adapter.quote("EstimateRevenue") }} as decimal(38,12)) as EstimateRevenue,
        {{ adapter.quote("Description") }},
        {{ adapter.quote("StatusID") }},
        {{ adapter.quote("PublishType") }},
        {{ adapter.quote("Activate") }},
        {{ adapter.quote("IsDeleted") }},
        {{ adapter.quote("CreatedDate") }},
        {{ adapter.quote("CreatedByID") }},
        {{ adapter.quote("CreatedByName") }},
        {{ adapter.quote("ModifiedDate") }},
        {{ adapter.quote("ModifiedByID") }},
        {{ adapter.quote("ModifiedByName") }},
        {{ adapter.quote("ParentID") }},
        {{ adapter.quote("BusinessOpportunityID") }},
        {{ adapter.quote("CustomerName") }},
        {{ adapter.quote("BaseSource") }},
        {{ adapter.quote("LastUpdateBase") }},
        {{ adapter.quote("ParentIndex") }},
        {{ adapter.quote("IsParent") }},
        {{ adapter.quote("IsLockFinance") }},
        {{ adapter.quote("ExpiryDate") }},
        {{ adapter.quote("FinancialYear") }},
        {{ adapter.quote("CustomerCode") }},
        {{ adapter.quote("SaleManUserName") }},
        {{ adapter.quote("SaleManFullName") }},
        {{ adapter.quote("GroupCode") }},
        {{ adapter.quote("GroupName") }},
        {{ adapter.quote("EstimateRevenueExist") }},
        {{ adapter.quote("Common") }},
        {{ adapter.quote("ProductManagerID") }},
        {{ adapter.quote("ProductManagerUserName") }},
        {{ adapter.quote("ProductManagerFullName") }},
        {{ adapter.quote("IsFinish") }},
        {{ adapter.quote("BoxmovingType") }},
        {{ adapter.quote("OrderID") }},
        {{ adapter.quote("Url") }},
        {{ adapter.quote("IsSync") }},
        {{ adapter.quote("DateSync") }},
        {{ adapter.quote("dv_record_source") }},
        {{ adapter.quote("dv_applied_date") }}

    from source
)
select * from renamed
  