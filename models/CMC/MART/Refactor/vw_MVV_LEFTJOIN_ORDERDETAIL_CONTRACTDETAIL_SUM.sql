select 
    a.opportunityid,a.opportunitycode
    , a.orderid,a.contractid
    , a.sumtotalbeforevatdetail
    , coalesce(b.total,sumtotalbeforevatdetail) as sumtotalbeforevat
    , b.lockdate as ngayghinhandoanhso
    , b.total as gthdkhoa
    ,a.RN
from
    (
        select
            ord.opportunityid,
            ord.opportunitycode,
            ord.orderid,
            ord.contractid,
            sum(ord.totalbeforevat) as sumtotalbeforevatdetail,
            count(*) as RN
        from {{ ref("vw_MVV_LEFTJOIN_ORDERDETAIL_CONTRACTDETAIL") }} ord
        group by ord.opportunityid, ord.opportunitycode, ord.orderid,ord.contractid
    ) a
left join
    "DEV_CMIS_DWH"."PowerBI"."vw_ContractLockStatus_Cleaning" b
    on a.contractid = b.contractid
