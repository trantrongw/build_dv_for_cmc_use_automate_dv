select _KEY_SALE,[Amount Exclude VAT]
from {{ ref('Sale') }}