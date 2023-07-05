select
    DISTINCT
    opp.ID as OpportunityID,
    opp.Code as OpportunityCode,
    coalesce(ord.OrderID, con.ContractID) as OrderID,
    coalesce(ord.OrderDetailID, con.ContractDetailID) as OrderDetailID,
    coalesce(ord.TotalBeforeVAT, con.TotalBeforeVAT) as TotalBeforeVAT,
    con.ContractID
from {{ source("DWH", "Staging__CMIS_dbo_Opportunities") }} opp
left join {{ ref("vw_Orders_Cleansing") }} ord on ord.OpportunityID = opp.ID
left join {{ ref("vw_Contracts_Cleansing") }} con on con.OpportunityID = opp.ID
where coalesce(ord.OpportunityID, con.OpportunityID) is not null
