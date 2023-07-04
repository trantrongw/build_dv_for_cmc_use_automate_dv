 SELECT
	Opp.ID AS MVV_ID,
	coalesce(QTHD.Profit,ec.Profit,bl.Profit) as LaiGop
FROM 
	{{ source("DWH", "Opportunities") }} Opp
	LEFT JOIN {{ ref('vw_BusinessPlans_Cleansing') }} bl	ON Opp.ID = 	bl.OpportunityID													
	LEFT JOIN {{ ref('vw_EstimateContracts_Cleansing') }} ec ON Opp.ID = ec.OpportunityID			
	LEFT JOIN {{ ref('vw_FinalizationContracts_Cleaning') }} QTHD ON Opp.ID = QTHD.OpportunityID
WHERE  Opp.Activate = 1