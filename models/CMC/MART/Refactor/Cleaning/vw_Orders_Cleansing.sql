{{ config(materialized='ephemeral') }}
select
    a.opportunityid,
    a.code as ordercode,
    a.id as orderid,
    b.id as orderdetailid,
    round(b.totalbeforevat, 0) totalbeforevat,
    round(a.totalbeforevat, 0) sumtotalbeforevat
    ,b.totalbeforevat/NULLIF(a.totalbeforevat,0) perc
from {{ source("DWH", "Staging__CMIS_dbo_Orders") }} a
inner join {{ source("DWH", "Staging__CMIS_dbo_OrderDetails") }} b on a.id = b.orderid
where a.activate = 1 and b.ismain = 1
