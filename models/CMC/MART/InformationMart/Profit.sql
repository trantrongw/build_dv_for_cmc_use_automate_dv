SELECT 
       CONVERT(
            VARCHAR(32),
            HASHBYTES('MD5', CONCAT_WS('$', C.ID, C.SaleManID, C.GroupID, CAST(E.LockDate AS DATE), b.SolutionBranchID))
              )AS _KEY_PROFIT,
       C.ID AS _KEY_OPP,
       C.SaleManID AS _KEY_EMPLOYEE,
       C.GroupID AS _KEY_DEPARTMENT,
       CAST(E.LockDate AS DATE) AS _KEY_SALE_DATE,
       b.SolutionBranchID AS _KEY_SOLUTION,
       SUM(COALESCE(QTHD.Profit, ec.Profit, bl.Profit) * (b.TotalBeforeVAT / a.TotalBeforeVAT)) AS Amount
FROM  {{ source("DWH", "Orders") }} a
    INNER JOIN {{ source("DWH", "OrderDetails") }} b
        ON a.ID = b.OrderID
    INNER JOIN  {{ source("DWH", "Opportunities") }} C
        ON a.OpportunityID = C.ID
    INNER JOIN {{ source("DWH", "Contracts") }} D
        ON a.OpportunityID = D.OpportunityID
    INNER JOIN {{ source("DWH", "ContractLockStatus") }} E
        ON D.ID = E.ContractID
    LEFT JOIN {{ ref('vw_BusinessPlans_Cleansing') }} bl	ON C.ID = 	bl.OpportunityID													
	LEFT JOIN {{ ref('vw_EstimateContracts_Cleansing') }} ec ON C.ID = ec.OpportunityID			
	LEFT JOIN {{ ref('vw_FinalizationContracts_Cleaning') }} QTHD ON C.ID = QTHD.OpportunityID
WHERE a.Activate = 1
      AND b.IsMain = 1
      AND C.Activate = 1
      AND D.Activate = 1
      AND E.IsLock = 1
GROUP BY C.ID,
         C.SaleManID,
         C.GroupID,
         CAST(E.LockDate AS DATE),
         b.SolutionBranchID 