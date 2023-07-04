select
    convert(nvarchar(500), opp.code) as opportunity_code,
    coalesce(g.id, 0) as _key_department,
    coalesce(opp.salemanid, 0) as _key_employee,
    coalesce(opp.customerid, 0) as _key_customer,
    lockcontract.ngayghinhandoanhso as _key_order_date,
    case
        when xhdth.invoice_date is null then 0 else xhdth.invoice_date
    end as _key_invoice_date,
    case
        when xhdth.tongxuathd is not null
        then
            (
                orderorcontract.totalbeforevat
                / nullif(coalesce(orderorcontract_sum.sumtotalbeforevatdetail, 0), 0)
                * xhdth.tongxuathd
                / nullif(coalesce(xhdmvv.sum_tongxuathd, 0), 0)
                * lockcontract.gthdkhoa
            )
        else
            (
                (
                    orderorcontract.totalbeforevat
                    / nullif(coalesce(orderorcontract_sum.sumtotalbeforevat, 0), 0)
                )
                * lockcontract.gthdkhoa
            )
    end as [sale amount],
    case
        when xhdth.tongxuathd is not null
        then
            (
                orderorcontract.totalbeforevat
                / nullif(coalesce(orderorcontract_sum.sumtotalbeforevat, 0), 0)
            )
            * v_mvvqtdtpa.laigop
            * (xhdth.tongxuathd / nullif(coalesce(xhdmvv.sum_tongxuathd, 0), 0))
        else
            (
                (
                    (
                        orderorcontract.totalbeforevat
                        / nullif(coalesce(orderorcontract_sum.sumtotalbeforevat, 0), 0)
                    )
                    * lockcontract.gthdkhoa
                )
                / nullif(coalesce(lockcontract.gthdkhoa, 0), 0)
            )
            * v_mvvqtdtpa.laigop
    end as [sale profit],
    orderorcontract.totalbeforevat
    * xhdth.tongxuathd
    / nullif(coalesce(orderorcontract_sum.sumtotalbeforevatdetail, 0), 0) as [
        invoice amount
    ],
    (
        orderorcontract.totalbeforevat
        / nullif(coalesce(orderorcontract_sum.sumtotalbeforevat, 0), 0)
    )
    * v_mvvqtdtpa.laigop
    * (
        xhdth.tongxuathd
        / nullif(coalesce(orderorcontract_sum.sumtotalbeforevatdetail, 0), 0)
    ) as [invoice profit]
from {{ source("DWH", "Opportunities") }} opp
left join {{ ref("V_XHD_TongHop") }} xhdth on opp.code = xhdth.opportunitycode
left join {{ ref("V_XHD_SumMVV") }} xhdmvv on opp.code = xhdmvv.opportunitycode
left join
    {{ ref("V_MVV_LEFTJOIN_ORDERDETAIL_CONTRACTDETAIL") }} orderorcontract
    on opp.id = orderorcontract.opportunityid
left join
    {{ ref("V_MVV_LEFTJOIN_ORDERDETAIL_CONTRACTDETAIL_SUM") }} orderorcontract_sum
    on opp.id = orderorcontract_sum.opportunityid
left join {{ ref("V_MVV_QT_DT_PA_V2") }} v_mvvqtdtpa on opp.id = v_mvvqtdtpa.mvv_id
left join
    {{ ref("V_CONTRACT_LOCK") }} lockcontract
    on lockcontract.mvv_id = orderorcontract.opportunityid
left join
    {{ source("DWH", "Dim_Date") }} c_date
    on c_date.date_key = format(lockcontract.ngayghinhandoanhso, 'yyyyMMdd')
left join {{ source("DWH", "Groups") }} g on g.id = opp.groupid
left join
    {{ source("DWH", "GroupHistories") }} gh
    on gh.groupid = opp.groupid
    and gh.financeyear = (
        case
            when
                lockcontract.mvv_id > 0
                and g.createddate > lockcontract.ngayghinhandoanhso
            then g.year
            when
                lockcontract.mvv_id > 0
                and g.createddate <= lockcontract.ngayghinhandoanhso
            then c_date.date_fscl_year_number
            when g.createddate > opp.createddate
            then g.year
            else opp.financialyear
        end
    )
where opp.opportunitytype <> 1