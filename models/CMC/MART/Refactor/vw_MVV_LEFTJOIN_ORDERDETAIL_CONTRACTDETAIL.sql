select
    DISTINCT
    opp.id as opportunityid,
    opp.Code as opportunityCode,
    coalesce(ord.orderid, con.contractid) as orderid,
    coalesce(ord.orderdetailid, con.contractdetailid) as orderdetailid,
    coalesce(ord.totalbeforevat, con.totalbeforevat) as totalbeforevat,
    con.contractid
from {{ source("DWH", "Staging__CMIS_dbo_Opportunities") }} opp
left join {{ ref("vw_Orders_Cleansing") }} ord on ord.opportunityid = opp.id
left join {{ ref("vw_Contracts_Cleansing") }} con on con.opportunityid = opp.id
where coalesce(ord.opportunityid, con.opportunityid) is not null
