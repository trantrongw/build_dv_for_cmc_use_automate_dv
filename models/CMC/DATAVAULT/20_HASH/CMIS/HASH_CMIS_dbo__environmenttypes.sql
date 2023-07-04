select
    *
from  {{ source('DWH', 'environmenttypes') }} 