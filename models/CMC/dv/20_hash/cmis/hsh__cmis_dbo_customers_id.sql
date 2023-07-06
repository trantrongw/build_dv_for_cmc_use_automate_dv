select 
  dv_hash_key_customer1 as dv_hash_key_customer, 
  customer_code1 as customer_code,
  *
FROM
{{ ref('hsh__cmis_dbo_customers') }}