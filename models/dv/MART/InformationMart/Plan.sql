{{ config(materialized='table') }}
SELECT 
	   CONVERT(VARCHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(C.SaleManID AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(C.GroupID AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(D.TheFirstOfQuarter AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(IIF(B.SolutionBranchID%2=1,10671,10816) AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^||^^')), 2) AS  _KEY_PLAN,	
	   C.SaleManID AS _KEY_EMPLOYEE,
	   C.GroupID AS _KEY_DEPARTMENT,
       D.TheFirstOfQuarter AS _KEY_SALE_DATE, 
       IIF(B.SolutionBranchID%2=1,10671,10816) AS _KEY_SOLUTION,
       CAST(SUM(B.TotalBeforeVAT) AS BIGINT) AS Amount
FROM dbo.Staging__CMIS_dbo_Orders A
    INNER JOIN dbo.Staging__CMIS_dbo_OrderDetails B
        ON A.ID = B.OrderID
    INNER JOIN dbo.Staging__CMIS_dbo_Opportunities C
        ON A.OpportunityID = C.ID
	INNER JOIN dbo.Staging__CMIS_dbo_Dim_Date D ON CAST(A.CreatedDate AS DATE ) = CAST(D.Date_Key	 AS DATE )
GROUP BY C.SaleManID,
	C.GroupID,
       D.TheFirstOfQuarter,
        IIF(B.SolutionBranchID%2=1,10671,10816)
HAVING SUM(B.TotalBeforeVAT) > 1000