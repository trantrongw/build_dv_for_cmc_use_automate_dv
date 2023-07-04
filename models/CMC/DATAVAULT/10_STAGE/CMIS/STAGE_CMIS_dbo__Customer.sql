select
    *
from  {{ source('DWH', 'customers') }} 