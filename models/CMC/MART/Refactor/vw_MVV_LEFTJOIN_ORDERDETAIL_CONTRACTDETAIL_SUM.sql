select 
    a.OpportunityID,a.OpportunityCode
    , a.OrderID,a.ContractID
    , coalesce(b.Total,SUMTotalBeforeVAT) as SUMTotalBeforeVAT
    , b.LockDate as ngayghinhandoanhso
    , b.Total as gthdkhoa
    ,a.RN
from
    (
        select
            ord.OpportunityID,
            ord.OpportunityCode,
            ord.OrderID,
            ord.ContractID,
            sum(ord.TotalBeforeVAT) as SUMTotalBeforeVAT,
            count(*) as RN
        from {{ ref("vw_MVV_LEFTJOIN_ORDERDETAIL_CONTRACTDETAIL") }} ord
        group by ord.OpportunityID, ord.OpportunityCode, ord.OrderID,ord.ContractID
    ) a
left join
    {{ ref("vw_ContractLockStatus_Cleaning") }} b
    on a.ContractID = b.ContractID


