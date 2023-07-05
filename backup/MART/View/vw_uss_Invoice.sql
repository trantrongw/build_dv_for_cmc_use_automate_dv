select _KEY_INVOICE,[Invoice Amount]
from {{ ref('Invoice') }}