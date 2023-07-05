{{ config(materialized='ephemeral') }}
select
    a.OpportunityID,
    a.Code as OrderCode,
    a.ID as OrderID,
    b.ID as OrderDetailID,
    round(b.TotalBeforeVAT, 0) TotalBeforeVAT,
    round(a.TotalBeforeVAT, 0) SUMTotalBeforeVAT
    ,b.TotalBeforeVAT/NULLIF(a.TotalBeforeVAT,0) PERC
from {{ source("DWH", "Staging__CMIS_dbo_Orders") }} a
inner join {{ source("DWH", "Staging__CMIS_dbo_OrderDetails") }} b on a.ID = b.OrderID
where a.Activate = 1 and b.IsMain = 1
