SELECT DISTINCT
       opp.ID AS opportunityid,
       opp.Code AS opportunityCode,
       COALESCE(ord.orderid, con.contractid) AS orderid,
       COALESCE(ord.orderdetailid, con.contractdetailid) AS orderdetailid,
       COALESCE(ord.totalbeforevat, con.totalbeforevat) AS totalbeforevat,
       COALESCE(lok.total, ord.sumtotalbeforevat, con.sumtotalbeforevat) AS sumtotalbeforevat,
       COALESCE(ord.perc,con.perc) AS Perc,
       COALESCE(ord.perc,con.perc) * lok.total AS Allocation,
       lok.lockdate ngayghinhandoanhso
FROM {{ source("DWH", "Opportunities") }} opp
    LEFT JOIN {{ ref("vw_Orders_Cleansing") }} ord
        ON ord.opportunityid = opp.ID
    LEFT JOIN {{ ref("vw_Contracts_Cleansing") }} con
        ON con.opportunityid = opp.ID
    LEFT JOIN {{ ref("vw_ContractLockStatus_Cleaning") }} lok
        ON con.contractid = lok.contractid