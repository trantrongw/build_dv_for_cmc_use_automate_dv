{{ config(materialized='ephemeral') }}
select
    a.opportunityid,
    a.id as contractid,
    b.id as contractdetailid,
    round(b.totalbeforevat, 0) totalbeforevat,
    round(a.TotalBeforeVAT, 0) sumtotalbeforevat
    ,b.totalbeforevat/NULLIF(a.totalbeforevat,0) perc
from {{ source("DWH", "Staging__CMIS_dbo_Contracts") }} a
left join {{ source("DWH", "Staging__CMIS_dbo_ContractDetails") }} b on a.id = b.contractid
where a.activate = 1
