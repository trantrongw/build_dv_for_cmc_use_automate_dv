{{ config(materialized='ephemeral') }}
select
    a.OpportunityID,
    a.ID as ContractID,
    b.ID as ContractDetailID,
    round(b.TotalBeforeVAT, 0) TotalBeforeVAT,
    round(a.TotalBeforeVAT, 0) SUMTotalBeforeVAT
    ,b.TotalBeforeVAT/NULLIF(a.TotalBeforeVAT,0) PERC
from {{ source("DWH", "Staging__CMIS_dbo_Contracts") }} a
left join {{ source("DWH", "Staging__CMIS_dbo_ContractDetails") }} b on a.ID = b.ContractID
where a.Activate = 1
