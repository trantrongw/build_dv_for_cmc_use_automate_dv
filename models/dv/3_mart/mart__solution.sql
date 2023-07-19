select 
	{% if target.name == 'dev' %} top 0 {% endif %}
	A.dv_hash_key_h_product as _KEY_SOLUTION
	,A.Code as SolutionCode
	,A.Name as SolutionName
	,A.Description as SolutionDesc 
	,A.Activate 
	,A.ParentID as SolutionParentID 
	,A.ADN 
	,cast(
		IIF(A.Code LIKE 'BM%', IIF(A.Code NOT LIKE 'BM1%', 'BigMove', N'Truyền thống'), N'Truyền thống') 
	as varchar(50)
	)	
	AS [Solution Type]
from {{ ref('dv__s_bv_h_product_lastest') }} A 