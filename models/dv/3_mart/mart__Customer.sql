WITH latest_customer AS (
    SELECT a.*
    FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY current_records.dv_hash_key_h_customer
               ORDER BY current_records.dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_h_customer" AS current_records
            
    ) AS a
    WHERE a.rank = 1
),
latest_user_customer AS (
    SELECT a.*, b.dv_hash_key_h_customer
    FROM (
        SELECT *,
            RANK() OVER (
               PARTITION BY dv_hash_key_l_user_customer
               ORDER BY dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo".dv__s_l_user_customer
            
    ) AS a
	inner join dv__l_user_customer b on a.dv_hash_key_l_user_customer = b.dv_hash_key_l_user_customer
    WHERE a.rank = 1 and a.AccountType=1 and a.Activate=1
)
select
A.dv_hash_key_h_customer as _KEY_CUSTOMER
,B.[Name] as [Customer Name]
,B.[Address]
,B.Phone
,B.Email 
,C.[Name] as [Customer Type]
,D.[Name] as [Industry]
from 
"dv__h_customer" A
	left join latest_customer B ON A.dv_hash_key_h_customer = B.dv_hash_key_h_customer
	left join dv__r_customertypes C		ON B.CustomerTypeID = C.ID
	left join dv__r_industrytypes D		ON B.IndustryTypeID = D.ID
	left join dv__r_environmenttypes E	ON B.EnvironmentTypeID = E.ID
	left join latest_user_customer F	ON A.dv_hash_key_h_customer = F.dv_hash_key_h_customer
