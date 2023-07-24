select
    *
from  {{ source('DWH', 'as_of_date') }} 