select _KEY_PLAN,Amount
from {{ ref('Plan') }}