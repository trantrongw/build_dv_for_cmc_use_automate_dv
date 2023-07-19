SELECT a.*, b.dv_hash_key_h_customer
    FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_l_user_customer
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM {{ ref('dv__s_l_user_customer') }} 
            
    ) AS a
	inner join {{ ref('dv__l_user_customer') }}  b on a.dv_hash_key_l_user_customer = b.dv_hash_key_l_user_customer
    WHERE a.rank = 1 and a.AccountType=1 and a.Activate=1