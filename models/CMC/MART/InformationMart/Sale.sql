SELECT CONVERT(VARCHAR(32),
                  HASHBYTES('MD5',CONCAT_WS('$',
                                            C.ID,
                                            C.SaleManID,
                                            C.GroupID,
                                            CAST(E.LockDate AS DATE)
                                            ,b.SolutionBranchID
                                           
                                            ,C.CustomerID
                                        )
                           ),2
              ) AS _KEY_SALE,
       C.ID AS _KEY_OPP,
       C.SaleManID AS _KEY_EMPLOYEE,
       C.CustomerID AS _KEY_CUSTOMER,
       C.GroupID AS _KEY_DEPARTMENT,
       CAST(E.LockDate AS DATE) AS _KEY_SALE_DATE,
       b.SolutionBranchID AS _KEY_SOLUTION
       ,SUM(b.TotalBeforeVAT) AS [Amount Exclude VAT]
FROM  {{ source("DWH", "Staging__CMIS_dbo_Orders") }} a
    INNER JOIN {{ source("DWH", "Staging__CMIS_dbo_OrderDetails") }} b
        ON a.ID = b.OrderID
    INNER JOIN  {{ source("DWH", "Staging__CMIS_dbo_Opportunities") }} C
        ON a.OpportunityID = C.ID
    INNER JOIN {{ source("DWH", "Staging__CMIS_dbo_Contracts") }} D
        ON a.OpportunityID = D.OpportunityID
    INNER JOIN {{ source("DWH", "Staging__CMIS_dbo_ContractLockStatus") }} E
        ON D.ID = E.ContractID
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
         ,C.CustomerID
		 