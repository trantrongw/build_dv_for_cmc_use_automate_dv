{{ config(materialized='table') }}
SELECT 
	   CONVERT(
                  VARCHAR(32),
                  HASHBYTES('MD5',CONCAT_WS('$',C.SaleManID,C.GroupID,D.TheFirstOfQuarter,IIF(B.SolutionBranchID%2=1,10671,10816)))
              ) AS _KEY_PLAN,	
	   C.SaleManID AS _KEY_EMPLOYEE,
	   C.GroupID AS _KEY_DEPARTMENT,
       D.TheFirstOfQuarter AS _KEY_SALE_DATE, 
       IIF(B.SolutionBranchID%2=1,10671,10816) AS _KEY_SOLUTION,
       CAST(SUM(B.TotalBeforeVAT) AS BIGINT) AS Amount
FROM dbo.Orders A
    INNER JOIN dbo.OrderDetails B
        ON A.ID = B.OrderID
    INNER JOIN dbo.Opportunities C
        ON A.OpportunityID = C.ID
	INNER JOIN dbo.Dim_Date D ON CAST(A.CreatedDate AS DATE ) = CAST(D.Date_Key	 AS DATE )
GROUP BY C.SaleManID,
	C.GroupID,
       D.TheFirstOfQuarter,
        IIF(B.SolutionBranchID%2=1,10671,10816)
HAVING SUM(B.TotalBeforeVAT) > 1000