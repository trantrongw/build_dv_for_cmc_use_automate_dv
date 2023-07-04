SELECT CONVERT(NVARCHAR(500), opp.Code) AS opportunity_code,
       coalesce(opp.GroupID, 0) as _key_department,
       COALESCE(opp.SaleManID, 0) AS _key_employee,
       COALESCE(opp.CustomerID, 0) AS _key_customer,
       CAST(OrdCon.ngayghinhandoanhso AS DATE) AS _key_order_date,
       Invoice.INVOICE_DATE AS _key_invoice_date,
       IIF(Invoice.TongXuatHD IS NOT NULL, OrdCon.Allocation * Invoice.Perc, OrdCon.Allocation) AS [Sale Amount],
       IIF(Invoice.TongXuatHD IS NOT NULL,OrdCon.Perc*Invoice.Perc*Profit.LaiGop,OrdCon.Perc*Profit.LaiGop) AS [Sale Profit]
	   ,OrdCon.Perc * Invoice.TongXuatHD AS [Invoice Amount]
	   ,OrdCon.Perc * Invoice.Perc * Profit.LaiGop AS [Invoice Profit]
from {{ source("DWH", "Opportunities") }} opp
left join {{ ref("vw_Invoice") }} Invoice on opp.code = Invoice.opportunitycode
left join {{ ref("vw_OrderContract") }} OrdCon on  opp.id = OrdCon.opportunityid
left join {{ ref("vw_Profit") }} Profit on opp.id = Profit.mvv_id
where opp.opportunitytype <> 1
and opp.Activate = 1