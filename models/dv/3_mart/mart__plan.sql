select 
	CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(E.dv_hash_key_h_user AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(E.dv_hash_key_h_department AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(G.TheFirstOfQuarter AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(IIF(RIGHT(A.dv_hash_key_h_product,1) >'5','2AABAF4E8EC2D733FB40F5A010AA1695','0650CA4123816C5A30F443C0590373E9') AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^||^^')), 2) AS  _KEY_PLAN
	,E.dv_hash_key_h_user AS _KEY_EMPLOYEE 
	,E.dv_hash_key_h_department AS _KEY_DEPARTMENT
	,G.TheFirstOfQuarter AS _KEY_SALE_DATE
	,IIF(RIGHT(A.dv_hash_key_h_product,1) >'5','2AABAF4E8EC2D733FB40F5A010AA1695','0650CA4123816C5A30F443C0590373E9') AS _KEY_SOLUTION
	,CAST(SUM(H.TotalBeforeVAT) AS BIGINT) AS Amount
from {{ ref('dv__l_orderdetail') }} A
inner join {{ ref('dv__h_order') }} B ON A.dv_hash_key_h_order = B.dv_hash_key_h_order
inner join {{ ref('dv__l_opportunity_order') }} C ON C.dv_hash_key_h_order = B.dv_hash_key_h_order
inner join {{ ref('dv__h_opportunity') }} D ON D.dv_hash_key_h_opportunity = C.dv_hash_key_h_opportunity
inner join {{ ref('dv__l_opportunity_customer_user_department') }} E ON E.dv_hash_key_h_opportunity = D.dv_hash_key_h_opportunity
inner join {{ ref('dv__s_bv_h_order_lastest') }} F ON F.dv_hash_key_h_order = A.dv_hash_key_h_order
inner join Staging__CMIS_dbo_Dim_Date G  ON  CAST(G.Date_Key AS DATE ) = CAST(F.CreatedDate AS DATE ) 
inner join {{ ref('dv__s_bv_l_orderdetail_lastest') }} H ON H.dv_hash_key_l_orderdetail = A.dv_hash_key_l_orderdetail
GROUP BY 
E.dv_hash_key_h_user
,E.dv_hash_key_h_department
,G.TheFirstOfQuarter
,IIF(RIGHT(A.dv_hash_key_h_product,1) >'5','2AABAF4E8EC2D733FB40F5A010AA1695','0650CA4123816C5A30F443C0590373E9')
HAVING SUM(H.TotalBeforeVAT) > 1000
