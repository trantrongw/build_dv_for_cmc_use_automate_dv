select _KEY_PROFIT,Amount
from {{ ref('Profit') }}