select
    *
from  {{ source('DWH', 'industrytypes') }} 