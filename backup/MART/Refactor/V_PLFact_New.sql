SELECT CONVERT(NVARCHAR(500), opp.Code) AS opportunity_code,
       coalesce(opp.GroupID, 0) as _key_department,
       COALESCE(opp.SaleManID, 0) AS _key_employee,
       COALESCE(opp.CustomerID, 0) AS _key_customer,
       CAST(OrdCon.ngayghinhandoanhso AS DATE) AS _key_order_date,
       Invoice.INVOICE_DATE AS _key_invoice_date,
       IIF(Invoice.TongXuatHD IS NOT NULL, OrdCon.Allocation * Invoice.PERC, OrdCon.Allocation) AS [Sale Amount],
       IIF(Invoice.TongXuatHD IS NOT NULL,OrdCon.PERC*Invoice.PERC*Profit.LaiGop,OrdCon.PERC*Profit.LaiGop) AS [Sale Profit]
	   ,OrdCon.PERC * Invoice.TongXuatHD AS [Invoice Amount]
	   ,OrdCon.PERC * Invoice.PERC * Profit.LaiGop AS [Invoice Profit]
from {{ source("DWH", "Staging__CMIS_dbo_Opportunities") }} opp
left join {{ ref("vw_Invoice") }} Invoice on opp.Code = Invoice.OpportunityCode
left join {{ ref("vw_OrderContract") }} OrdCon on  opp.ID = OrdCon.OpportunityID
left join {{ ref("vw_Profit") }} Profit on opp.ID = Profit.MVV_ID
where opp.OpportunityType <> 1
and opp.Activate = 1