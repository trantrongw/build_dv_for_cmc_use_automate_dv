select 
	A.dv_hash_key_h_department as _KEY_DEPARTMENT,
    A.GroupCode as [Department Code],
    A.GroupName as [Department Name]
from {{ ref('dv__s_bv_h_department_lastest') }} A 
WHERE A.IsActive = 1 and A.IsVirtual=0 