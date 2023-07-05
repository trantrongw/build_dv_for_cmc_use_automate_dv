SELECT DISTINCT
       opp.ID AS OpportunityID,
       opp.Code AS OpportunityCode,
       COALESCE(ord.OrderID, con.ContractID) AS OrderID,
       COALESCE(ord.OrderDetailID, con.ContractDetailID) AS OrderDetailID,
       COALESCE(ord.TotalBeforeVAT, con.TotalBeforeVAT) AS TotalBeforeVAT,
       COALESCE(lok.Total, ord.SUMTotalBeforeVAT, con.SUMTotalBeforeVAT) AS SUMTotalBeforeVAT,
       COALESCE(ord.PERC,con.PERC) AS PERC,
       COALESCE(ord.PERC,con.PERC) * lok.Total AS Allocation,
       lok.LockDate ngayghinhandoanhso
FROM {{ source("DWH", "Staging__CMIS_dbo_Opportunities") }} opp
    LEFT JOIN {{ ref("vw_Orders_Cleansing") }} ord
        ON ord.OpportunityID = opp.ID
    LEFT JOIN {{ ref("vw_Contracts_Cleansing") }} con
        ON con.OpportunityID = opp.ID
    LEFT JOIN {{ ref("vw_ContractLockStatus_Cleaning") }} lok
        ON con.ContractID = lok.ContractID