--fix
select
A.dv_hash_key_h_customer as _KEY_CUSTOMER
,B.[Name] as [Customer Name]
,B.[Address]
,B.Phone
,B.Email 
,C.[Name] as [Customer Type]
,D.[Name] as [Industry]
from 
{{ ref('dv__h_customer') }} A
	left join {{ ref('dv__s_bv_h_customer_lastest') }} B ON A.dv_hash_key_h_customer = B.dv_hash_key_h_customer
	left join {{ ref('dv__r_customertypes') }} C		ON B.CustomerTypeID = C.ID
	left join {{ ref('dv__r_industrytypes') }} D		ON B.IndustryTypeID = D.ID
	left join {{ ref('dv__r_environmenttypes') }} E	ON B.EnvironmentTypeID = E.ID
	left join {{ ref('dv__s_bv_l_user_customer_activesaler_lastest') }} F	ON A.dv_hash_key_h_customer = F.dv_hash_key_h_customer
