
select o1.ID OpportunityID
        ,cl.GTHDKhoa
		--Nếu có số Khóa HD thì ưu tiên lấy trước, không có khóa thì lấy tổng detail
        ,(case when cl.GTHDKhoa > 0 then cl.GTHDKhoa else
            (case when ord.OpportunityID > 0 then ord.TotalBeforeVAT else ord1.TotalBeforeVAT end) end) as SumTotalBeforeVAT
        ,(case when ord.OpportunityID > 0 then ord.TotalBeforeVAT else ord1.TotalBeforeVAT end) as SumTotalBeforeVATDetail
        , cl.NgayGhiNhanDoanhSo
        , ord1.ID AS ContractID
		, ord.ID as OrderID
	from {{ source('DWH', 'Opportunities') }} o1
	left join 
	(
		select c.OpportunityID,  sum(dd.TotalBeforeVAT) TotalBeforeVAT ,c.ID
		from {{ source('DWH', 'OrderDetails') }}  dd 
		inner join {{ source('DWH', 'Orders') }} c on c.Activate=1 and c.ID = dd.OrderID 
		where dd.TotalBeforeVAT > 0
		group by c.OpportunityID,c.ID
	) ord on ord.OpportunityID = o1.ID
	left join 
	(
		select c.OpportunityID,  sum(dd.TotalBeforeVAT) TotalBeforeVAT,c.ID 
		from {{ source('DWH', 'ContractDetails') }} dd 
		right join {{ source('DWH', 'Contracts') }} c on c.Activate=1 and c.ID = dd.ContractID  --■■■■■■■■■
		where dd.TotalBeforeVAT > 0
		group by c.OpportunityID, c.ID
	) ord1 on ord1.OpportunityID = o1.ID
    left join V_Contract_Lock cl on cl.MVV_ID = o1.ID