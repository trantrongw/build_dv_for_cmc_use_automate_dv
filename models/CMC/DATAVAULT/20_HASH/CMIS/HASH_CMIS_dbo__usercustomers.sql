select
    *
from  {{ source('DWH', 'usercustomers') }} 