select
    *
from  {{ source('DWH', 'Staging__CMIS_dbo_IndustryTypes') }} 