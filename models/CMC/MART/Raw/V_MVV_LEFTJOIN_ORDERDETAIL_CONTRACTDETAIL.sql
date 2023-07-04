WITH 
ord AS
(SELECT c.OpportunityID, dd.ID, dd.OrderID AS ContractID, dd.NameProductBranchID, dd.SolutionBranchID ,dd.ProductBranchID, dd.VendorBranchID, dd.NameSolutionBranchNameID, CAST(SUBSTRING(dd.ProductName,1,2000) AS NVARCHAR(2000)) AS ProductName, dd.NameVendorBranchID, dd.NameSolutionBranchID, dd.TotalBeforeVAT,dd.CreatedDate,dd.SolutionBranchNameID 
FROM  {{ source("DWH", "OrderDetails") }} dd 
	INNER JOIN {{ source("DWH", "Orders") }} c ON c.Activate=1 AND c.ID = dd.OrderID 
		AND dd.IsMain = 1),
ord1 AS 
(SELECT c.OpportunityID, dd.ID, c.ID AS ContractID, dd.NameProductBranchID, dd.SolutionBranchID ,dd.ProductBranchID, dd.VendorBranchID, dd.NameSolutionBranchNameID, dd.ProductName, dd.NameVendorBranchID, dd.NameSolutionBranchID, dd.TotalBeforeVAT ,dd.CreatedDate,dd.SolutionBranchNameID
FROM {{ source("DWH", "ContractDetails") }} dd 
	INNER JOIN {{ source("DWH", "Contracts") }} c ON c.ID = dd.ContractID 
WHERE c.Activate=1) 

SELECT 
    DISTINCT o1.ID OpportunityID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.ID ELSE ord1.ID END) AS ID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.ContractID ELSE ord1.ContractID END) AS ContractID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.NameProductBranchID ELSE ord1.NameProductBranchID END) AS NameProductBranchID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.SolutionBranchID ELSE ord1.SolutionBranchID END) AS SolutionBranchID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.SolutionBranchNameID ELSE ord1.SolutionBranchNameID END) AS SolutionBranchNameID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.ProductBranchID ELSE ord1.ProductBranchID END) AS ProductBranchID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.VendorBranchID ELSE ord1.VendorBranchID END) AS VendorBranchID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.NameSolutionBranchNameID ELSE ord1.NameSolutionBranchNameID END) AS NameSolutionBranchNameID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.ProductName ELSE ord1.ProductName END) AS ProductName
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.NameVendorBranchID ELSE ord1.NameVendorBranchID END) AS NameVendorBranchID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.NameSolutionBranchID ELSE ord1.NameSolutionBranchID END) AS NameSolutionBranchID
    ,(CASE WHEN ord.OpportunityID > 0 THEN ord.TotalBeforeVAT ELSE ord1.TotalBeforeVAT END) AS TotalBeforeVAT
	,(CASE WHEN ord.OpportunityID > 0 THEN ord.CreatedDate ELSE ord1.CreatedDate END) AS CreatedDate
    ,(CASE WHEN ord.OpportunityID > 0 THEN 1 ELSE 0 END) AS isOrderId
    ,ord1.ContractID AS RealContractID 
from {{ source("DWH", "Opportunities") }} o1
left join ord on ord.opportunityid = o1.id
left join ord1 on ord1.opportunityid = o1.id
where coalesce(ord.id, ord1.id) is not null