{{ config(materialized='ephemeral') }}
select
    a.opportunityid,
    a.code as ordercode,
    a.id as orderid,
    b.id as orderdetailid,
    round(b.totalbeforevat, 0) totalbeforevat,
    round(a.totalbeforevat, 0) sumtotalbeforevat
    ,b.totalbeforevat/NULLIF(a.totalbeforevat,0) perc
from {{ source("DWH", "Orders") }} a
inner join {{ source("DWH", "OrderDetails") }} b on a.id = b.orderid
where a.activate = 1 and b.ismain = 1
