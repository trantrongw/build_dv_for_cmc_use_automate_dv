select 
  dv_hash_key_huh_customer2 as dv_hash_key_customer, 
  customer_code2 as customer_code,
  *
FROM
{{ ref('hash__cmis_dbo_customers') }}