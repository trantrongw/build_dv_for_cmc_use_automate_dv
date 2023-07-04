select 
	A.ID as _KEY_DEPARTMENT,
    A.GroupCode as [Department Code],
    A.GroupName as [Department Name]
from {{ source('DWH', 'Staging__CMIS_dbo_Groups') }}  A 
where A.isactive = 1 and A.IsVirtual=0 