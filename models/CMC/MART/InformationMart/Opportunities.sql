select 
    A.ID AS _KEY_OPP
    ,A.Code as Code
	,CAST(A.CreatedDate AS DATE) AS _KEY_OPP_DATE
	,A.StatusID AS _KEY_OPP_STATUS
from {{ source("DWH", "Opportunities") }} A