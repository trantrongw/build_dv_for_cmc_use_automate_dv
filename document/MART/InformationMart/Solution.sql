select 
	A.ID as _KEY_SOLUTION
	,A.Code as SolutionCode
	,A.Name as SolutionName
	,A.Description as SolutionDesc 
	,A.Activate 
	,A.ParentID as SolutionParentID 
	,A.ADN 
	,IIF(A.Code LIKE 'BM%', IIF(A.Code NOT LIKE 'BM1%', 'BigMove', N'Truyền thống'), N'Truyền thống') AS [Solution Type]
from dbo.Staging__CMIS_dbo_Branches A 