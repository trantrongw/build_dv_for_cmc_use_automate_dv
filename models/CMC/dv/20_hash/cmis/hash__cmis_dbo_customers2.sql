select
dv_hash_key_h_customer2 as dv_hash_key_h_customer,
customer_code2 as customer_code,
dv_tenant_id,
dv_collisioncode,
dv_load_timestamp,
dv_recordsource
from
{{ ref('hash__cmis_dbo_customers') }}