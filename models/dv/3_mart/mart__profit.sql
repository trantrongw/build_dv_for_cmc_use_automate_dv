select 
		CONVERT(CHAR(32), HASHBYTES('MD5', NULLIF(CONCAT(
        ISNULL(NULLIF(UPPER(TRIM(CAST(D.dv_hash_key_h_opportunity AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(E.dv_hash_key_h_user AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(E.dv_hash_key_h_department AS VARCHAR(MAX)))), ''), '^^'), '||',
		ISNULL(NULLIF(UPPER(TRIM(CAST(CAST(J.LockDate AS DATE) AS VARCHAR(MAX)))), ''), '^^'), '||',
        ISNULL(NULLIF(UPPER(TRIM(CAST(A.dv_hash_key_h_product AS VARCHAR(MAX)))), ''), '^^')
    ), '^^||^^||^^||^^')), 2) AS  _KEY_PROFIT
	,D.dv_hash_key_h_opportunity AS _KEY_OPP
    ,E.dv_hash_key_h_user AS _KEY_EMPLOYE
	,E.dv_hash_key_h_department AS _KEY_DEPARTMENT
    ,CAST(J.LockDate AS DATE) AS _KEY_SALE_DATE
	,A.dv_hash_key_h_product AS _KEY_SOLUTION
	,SUM(COALESCE(T.Profit, S.Profit, R.Profit) * (I.TotalBeforeVAT / K.TotalBeforeVAT)) AS Amount
from {{ ref('dv__l_orderdetail') }} A 
	inner join {{ ref('dv__h_order') }} B ON A.dv_hash_key_h_order = B.dv_hash_key_h_order
	inner join {{ ref('dv__l_opportunity_order') }} C ON C.dv_hash_key_h_order = B.dv_hash_key_h_order
	inner join {{ ref('dv__h_opportunity') }} D ON D.dv_hash_key_h_opportunity = C.dv_hash_key_h_opportunity
	inner join {{ ref('dv__l_opportunity_customer_user_department') }} E ON E.dv_hash_key_h_opportunity = D.dv_hash_key_h_opportunity
	inner join {{ ref('dv__l_opportunity_contract') }} F ON F.dv_hash_key_h_opportunity = D.dv_hash_key_h_opportunity
	inner join {{ ref('dv__h_contract') }} G ON G.dv_hash_key_h_contract = F.dv_hash_key_h_contract
	inner join {{ ref('dv__l_contract_lockstatus') }} H ON H.dv_hash_key_h_contract = G.dv_hash_key_h_contract
	inner join {{ ref('dv__s_bv_l_contract_lockstatus_cleaned_lastest') }} J ON J.dv_hash_key_l_contract_lockstatus = H.dv_hash_key_l_contract_lockstatus
	inner join {{ ref('dv__s_bv_l_orderdetail_lastest') }} I ON I.dv_hash_key_l_orderdetail = A.dv_hash_key_l_orderdetail
	inner join {{ ref('dv__s_bv_h_order_lastest') }} K ON K.dv_hash_key_h_order = B.dv_hash_key_h_order
	inner join {{ ref('dv__s_bv_h_opportunity_lastest') }} L ON L.dv_hash_key_h_opportunity = D.dv_hash_key_h_opportunity
	inner join {{ ref('dv__s_bv_h_contract_cleaned_lastest') }} M ON M.dv_hash_key_h_contract = G.dv_hash_key_h_contract
	left join  {{ ref('dv__l_opportunity_businessplan') }} N ON N.dv_hash_key_h_opportunity = D.dv_hash_key_h_opportunity
	left join  {{ ref('dv__l_opportunity_estimatecontract') }} O ON O.dv_hash_key_h_opportunity = D.dv_hash_key_h_opportunity
	left join  {{ ref('dv__l_opportunity_finalizationcontract') }} P ON P.dv_hash_key_h_opportunity = D.dv_hash_key_h_opportunity
	left join  {{ ref('dv__s_bv_h_businessplan_cleaned_lastest') }} R ON R.dv_hash_key_h_businessplan =N.dv_hash_key_h_businessplan
	left join  {{ ref('dv__s_bv_h_estimatecontract_cleaned_lastest') }} S ON S.dv_hash_key_h_estimatecontract =O.dv_hash_key_h_estimatecontract
	left join  {{ ref('dv__s_bv_h_finalizationcontract_cleaned_lastest') }} T ON T.dv_hash_key_h_finalizationcontract =P.dv_hash_key_h_finalizationcontract
GROUP BY
D.dv_hash_key_h_opportunity
    ,E.dv_hash_key_h_user 
	,E.dv_hash_key_h_department
    ,CAST(J.LockDate AS DATE) 
	,A.dv_hash_key_h_product;


