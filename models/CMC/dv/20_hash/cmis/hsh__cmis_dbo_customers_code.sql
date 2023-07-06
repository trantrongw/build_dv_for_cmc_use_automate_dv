select 
  dv_hash_key_customer2 as dv_hash_key_customer, 
  customer_code2 as customer_code,
  *
FROM
{{ ref('hsh__cmis_dbo_customers') }}