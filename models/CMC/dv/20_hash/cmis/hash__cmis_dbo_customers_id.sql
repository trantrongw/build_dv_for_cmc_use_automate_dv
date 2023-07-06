select 
  dv_hash_key_huh_customer1 as dv_hash_key_customer, 
  customer_code1 as customer_code,
  *
FROM
{{ ref('hash__cmis_dbo_customers') }}