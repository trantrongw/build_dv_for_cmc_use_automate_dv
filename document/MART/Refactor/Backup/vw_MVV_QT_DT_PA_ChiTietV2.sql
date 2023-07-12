SELECT
	bl.OpportunityID AS MVV_ID
	,bl.Profit as PAKD_LaiGo
	,ec.Profit as DTHD_LaiGop
	,QTHD.Profit as QTDA_LaiGop
FROM 
	{{ ref('vw_BusinessPlans_Cleansing') }} bl																
	LEFT JOIN {{ ref('vw_EstimateContracts_Cleansing') }} ec ON bl.OpportunityID = ec.OpportunityID			
	LEFT JOIN {{ ref('vw_FinalizationContracts_Cleaning') }} QTHD ON bl.OpportunityID = QTHD.OpportunityID