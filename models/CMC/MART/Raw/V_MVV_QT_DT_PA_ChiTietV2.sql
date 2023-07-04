SELECT
    Opportunities.ID AS MVV_ID
	,Opportunities.Code AS MVV
	,QTHD.WFIsFinish as QTDA_IsFinish
	,QTT.WFIsFinish as QTT_IsFinish
	,ec.WFIsFinish as DTHD_IsFinish
	,bl.WFIsFinish as PAKD_IsFinish
	,DTTV.WFIsFinish as DTTV_IsFinish
	,DTTK.WFIsFinish as DTTK_IsFinish
	,FinalizationEstimates.WFIsFinish as QTTK_IsFinish
	,case when QTTKT.OpportunityID > 0 then 1 else 0 end as QTTKT_IsFinish

	,QTHD.WFStatusName AS QTHD_TrangThai
	,QTHD.WFFinishDate AS QTHD_NgayHT
	,QTHD.WFProcessByName AS QTHD_XuLy
	,QTT.WFStatusName AS QTT_TrangThai
	,ec.WFStatusName AS DTHD_TrangThai
	,bl.WFStatusName as PAKD_TrangThai
	-- Doanh thu
	,QTHD.Revenue as QTDA_DT	
	,QTT.Revenue as QTT_DT	
	,ec.Revenue as DTHD_DT	
	,bl.Revenue as PAKD_DT	
	-- Giá vốn
	,QTHD.Cost as QTDA_GVHBKH	
	,QTT.Cost as QTT_GVHBKH	
	,ec.Cost as DTHD_GVHBKH	
	,bl.Cost as PAKD_GVHBKH	
	-- GVMN - Giá vốn vật tư
	,QTHD.TotalMaterialCost + QTHD.TotalOtherMaterialCost as QTDA_DVMN
	,QTT.TotalMaterialCost + QTT.TotalOtherMaterialCost as QTT_DVMN
	,ec.TotalMaterialCost + ec.TotalOtherMaterialCost as DTHD_DVMN
	,bl.TotalMaterialCost + bl.TotalOtherMaterialCost as PAKD_DVMN
	-- Chi phí bằng tiền
	,QTHD.CostByMoney as QTHD_CPBT
	,QTT.CostByMoney as QTT_CPBT
	,ec.ConsultantPrice + ec.DeploymentPrice as DTHD_CPBT
	,bl.ConsultantPrice + bl.DeploymentPrice as PAKD_CPBT
	-- Giá vốn bảo hành cho thuê
	,bl.WarrantyDetailCost as PAKD_GVBHCT
	,ec.WarrantyDetailCost as DTHD_GVBHCT
	,QTHD.WarrantyDetailCost as QTHD_GVBHCT
	,QTT.WarrantyDetailCost as QTT_GVBHCT
	-- Chi phí trích bảo hành chuẩn
	,bl.WarrantyPaymentPrice as PAKD_CPTBHC
	,ec.TotalWarrantyPaymentPrice as DTHD_CPTBHC
	,QTT.TotalWarrantyPaymentPrice as QTT_CPTBHC
	,QTHD.TotalWarrantyPaymentPrice as QTHD_CPTBHC
	-- Chi phí BH gia tăng, BHUQ
	,bl.WarrantyPriceIncrease as PAKD_CPBHGT
	,ec.WarrantyPriceIncrease as DTHD_CPBHGT
	,QTT.WarrantyBHUQ as QTT_CPBHGT
	,QTHD.WarrantyBHUQ as QTHD_CPBHGT

	-- Lợi nhuận gộp theo phiếu
	,QTHD.Profit as QTDA_LaiGop
	,QTT.Profit as QTT_LaiGop
	,ec.Profit as DTHD_LaiGop
	,bl.Profit as PAKD_LaiGop

	-- Lợi nhuận gộp tính theo version cũ
	,bl.Revenue - (bl.Cost + bl.TotalMaterialCost + bl.TotalOtherMaterialCost + bl.ConsultantPrice + bl.DeploymentPrice +
				   bl.WarrantyDetailCost + bl.WarrantyPaymentPrice + bl.WarrantyPriceIncrease
				   ) as PAKD_LaiGopV2
	,ec.Revenue - (ec.Cost + ec.TotalMaterialCost + ec.TotalOtherMaterialCost + ec.ConsultantPrice + ec.DeploymentPrice +
				   ec.WarrantyDetailCost + ec.TotalWarrantyPaymentPrice + ec.WarrantyPriceIncrease
				   ) as DTHD_LaiGopV2
	,QTT.Revenue - (QTT.Cost + QTT.TotalMaterialCost + QTT.TotalOtherMaterialCost + QTT.CostByMoney +
				   QTT.WarrantyDetailCost + QTT.TotalWarrantyPaymentPrice + QTT.WarrantyBHUQ
				   ) as QTT_LaiGopV2
	,QTHD.Revenue - (QTHD.Cost + QTHD.TotalMaterialCost + QTHD.TotalOtherMaterialCost + QTHD.CostByMoney +
				   QTHD.WarrantyDetailCost + QTHD.TotalWarrantyPaymentPrice + QTHD.WarrantyBHUQ
				   ) as QTDA_LaiGopV2

	--Chi phí tài chính	
	,QTHD.TotalFinancial as QTDA_CPTC
	,QTT.TotalFinancial as QTT_CPTC
	,ec.TotalFinancial as DTHD_CPTC
	,bl.TotalFinancial as PAKD_CPTC
	--Chi phí nhân công
	,QTHD.TotalManday as QTHD_CPNC
	,QTT.TotalManday as QTT_CPNC
	,ec.ConsultantManday + ec.DeloymentManday as DTHD_CPNC
	,bl.ConsultantManday + bl.DeloymentManday as PAKD_CPNC
	-- Chi phí Marketing
	,QTHD.TotalMarketing as QTDA_TotalMarketing
	,QTT.TotalMarketing as QTT_TotalMarketing
	,ec.TotalMarketing as DTHD_TotalMarketing
	,bl.TotalMarketing as PAKD_TotalMarketing
	--Chi phí khác
	,bl.TotalOhters as PAKD_CPK
	,ec.TotalOhters as DTHD_CPK
	,QTT.TotalOhters as QTT_CPK
	,QTHD.TotalOhters as QTHD_CPK

	--Lãi thuần theo phiếu
	,QTHD.TotalProfit as QTDA_LaiThuan
	,QTT.TotalProfit as QTT_LaiThuan
	,ec.TotalProfit as DTHD_LaiThuan
	,bl.TotalProfit as PAKD_LaiThuan

	--Lãi thuần tính theo version cũ
	,bl.Revenue - (bl.Cost + bl.TotalMaterialCost + bl.TotalOtherMaterialCost + bl.ConsultantPrice + bl.DeploymentPrice +
				   bl.WarrantyDetailCost + bl.WarrantyPaymentPrice + bl.WarrantyPriceIncrease) 
				- (bl.TotalFinancial + bl.ConsultantManday + bl.DeloymentManday + bl.TotalMarketing + bl.TotalOhters)as PAKD_LaiThuanV2
	,ec.Revenue - (ec.Cost + ec.TotalMaterialCost + ec.TotalOtherMaterialCost + ec.ConsultantPrice + ec.DeploymentPrice +
				   ec.WarrantyDetailCost + ec.TotalWarrantyPaymentPrice + ec.WarrantyPriceIncrease)
				- (ec.TotalFinancial + ec.ConsultantManday + ec.DeloymentManday + ec.TotalMarketing + ec.TotalOhters)as DTHD_LaiThuanV2
	,QTT.Revenue - (QTT.Cost + QTT.TotalMaterialCost + QTT.TotalOtherMaterialCost + QTT.CostByMoney +
				   QTT.WarrantyDetailCost + QTT.TotalWarrantyPaymentPrice + QTT.WarrantyBHUQ) 
				- (QTT.TotalFinancial + QTT.TotalManday + QTT.TotalMarketing + QTT.TotalOhters)as QTT_LaiThuanV2
	,QTHD.Revenue - (QTHD.Cost + QTHD.TotalMaterialCost + QTHD.TotalOtherMaterialCost + QTHD.CostByMoney +
				   QTHD.WarrantyDetailCost + QTHD.TotalWarrantyPaymentPrice + QTHD.WarrantyBHUQ)
				- (QTHD.TotalFinancial + QTHD.TotalManday + QTHD.TotalMarketing + QTHD.TotalOhters)as QTDA_LaiThuanV2

	,DTTV.TotalMoney as DTTV_CPTV_BangTien
	,DTTV.TotalManday as DTTV_CPNC
	,FinalizationEstimates.TotalFinalizationMoney as QTTK_CPTK_BangTien
	,FinalizationEstimates.TotalFinalizationManday as QTTK_CPNCTK
	,QTTKT.TotalFinalizationMoney as QTTKT_CPTK_BangTien
	,QTTKT.TotalFinalizationManday as QTTKT_CPNCTK
	,DTTK.TotalManday as DTTK_CPNCTK
	,DTTK.TotalMoney as DTTK_CPTK_BangTien
	
	FROM {{ source('DWH', 'Opportunities') }}
	LEFT JOIN {{ source('DWH', 'EstimateContracts') }} ec --Dự toán hợp đồng
	ON Opportunities.ID = ec.OpportunityID AND (ec.Activate = 1) AND (ec.PublishType != 2)--Điều chỉnh lại cho những MVV tự tạo DTHD
										--AND (CMIS.dbo.ec.WFIsFinish = 1)
	LEFT JOIN -- Quyết toán Hợp đồng
		(
			SELECT   a.ID, a.OpportunityID, a.Code,  a.TotalPrice, a.WFIsFinish, a.WFStatusName, a.TotalPriceEstimate, a.Revenue, a.WareReturn, a.RevenueProfit, a.VariableCost, a.Cost, a.TotalWareReturn, a.TotalMaterialCost, a.TotalOtherMaterialCost, a.CostByMoney, 
				a.WarrantyDetailCost, a.TotalWarrantyPaymentPrice, a.WarrantyBHUQ, a.Profit, a.TotalFinancial, a.TotalManday, a.TotalMarketing, a.TotalOhters, a.TotalProfit, a.FinalizationContractType, a.WFFinishDate, a.WFProcessByName
			FROM {{ source('DWH', 'FinalizationContracts') }} a 
			INNER JOIN 
				(
				SELECT OpportunityID, MAX(ModifiedDate) AS ModifiedDate
				FROM {{ source('DWH', 'FinalizationContracts') }} b WHERE WFIsFinish = 1 AND Activate = 1 and FinalizationContractType = 2
				GROUP BY OpportunityID
				) x ON x.OpportunityID = a.OpportunityID AND a.ModifiedDate = x.ModifiedDate
			where FinalizationContractType = 2
		) QTHD ON Opportunities.ID = QTHD.OpportunityID
	LEFT JOIN -- Quyêt toán tạm
		(
			SELECT  a.OpportunityID, a.Code,  a.TotalPrice, a.WFIsFinish, a.WFStatusName, a.TotalPriceEstimate, a.Revenue, a.WareReturn, a.RevenueProfit, a.VariableCost, a.Cost, a.TotalWareReturn, a.TotalMaterialCost, a.TotalOtherMaterialCost, a.CostByMoney, 
				a.WarrantyDetailCost, a.TotalWarrantyPaymentPrice, a.WarrantyBHUQ, a.Profit, a.TotalFinancial, a.TotalManday, a.TotalMarketing, a.TotalOhters, a.TotalProfit, a.FinalizationContractType
			FROM {{ source('DWH', 'FinalizationContracts') }} a -- Quyết toán Hợp đồng
			INNER JOIN 
				(
				SELECT OpportunityID, MAX(ModifiedDate) AS ModifiedDate
				FROM {{ source('DWH', 'FinalizationContracts') }} b WHERE WFIsFinish = 1 AND Activate = 1 and FinalizationContractType = 1
				GROUP BY OpportunityID
				) x ON x.OpportunityID = a.OpportunityID AND a.ModifiedDate = x.ModifiedDate
			where FinalizationContractType = 1
		) QTT ON Opportunities.ID = QTT.OpportunityID
	--PAKD
	LEFT JOIN (SELECT OpportunityID, TotalFinancial, TotalProfit,DeploymentPrice, Profit, WFIsFinish, TotalMaterialCost, 
					  TotalOtherMaterialCost, TotalMarketing, ConsultantPrice, ConsultantManday, DeloymentManday, Cost, 
					  WFStatusName, WarrantyDetailCost, WarrantyPaymentPrice, WarrantyPriceIncrease, Revenue, TotalOhters
				FROM {{ source('DWH', 'BusinessPlans') }} BusinessPlans_1 -- Phương án kinh doanh
				WHERE Activate = 1 AND PublishType = 1) bl ON Opportunities.ID = bl.OpportunityID 
	LEFT JOIN (SELECT OpportunityID, WFIsFinish, TotalManday, TotalMoney
				FROM {{ source('DWH', 'Estimates') }} --EstimateType = 1 : DTTV
				WHERE Activate = 1 AND EstimateType = 1 AND IsDetail = 0 AND WFIsFinish = 1) DTTV ON Opportunities.ID = DTTV.OpportunityID 
	LEFT JOIN (SELECT OpportunityID, WFIsFinish, TotalManday, TotalMoney
				FROM {{ source('DWH', 'Estimates') }} Estimates_1 --EstimateType = 2 : DTTK
				WHERE Activate = 1 AND EstimateType = 2 AND IsDetail = 0 AND WFIsFinish = 1) DTTK ON Opportunities.ID = DTTK.OpportunityID 
	LEFT JOIN (SELECT OpportunityID, TotalEstimateManday, WFIsFinish, TotalFinalizationMoney, TotalFinalizationManday
				FROM  {{ source('DWH', 'FinalizationEstimates') }} FinalizationEstimates_1 -- QTTK thật
				WHERE Activate = 1 and IsTemp = 0) FinalizationEstimates ON Opportunities.ID = FinalizationEstimates.OpportunityID
	LEFT JOIN (
				SELECT OpportunityID, sum(TotalEstimateManday) TotalEstimateManday, sum(TotalFinalizationMoney) TotalFinalizationMoney, sum(TotalFinalizationManday) TotalFinalizationManday
				FROM  {{ source('DWH', 'FinalizationEstimates') }}  FinalizationEstimates_1 -- QTTK thật
				WHERE Activate = 1 and IsTemp = 1 and WFIsFinish = 1
				group by OpportunityID) QTTKT ON Opportunities.ID = QTTKT.OpportunityID
	WHERE  Opportunities.Activate = 1