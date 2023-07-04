select
    *
from  {{ source('DWH', 'CustomerTypes') }} 