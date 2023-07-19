select 
{% if target.name == 'dev' %} top 0 {% endif %}
    B.dv_hash_key_h_opportunity AS _KEY_OPP
    ,D.opportunity_code as Code
	,CAST(B.CreatedDate AS DATE) AS _KEY_OPP_DATE
	,ISNULL(B.StatusID,1) AS _KEY_OPP_STATUS
from 
{{ ref("dv__h_opportunity") }} A
inner join {{ ref("dv__s_bv_h_opportunity_lastest") }} B ON A.dv_hash_key_h_opportunity = B.dv_hash_key_h_opportunity
inner join {{ ref("dv__l_opportunity_sa") }} C ON A.dv_hash_key_h_opportunity = C.dv_duplicate_hash_key_h_opportunity
inner join {{ ref("dv__h_opportunity") }} D ON D.dv_hash_key_h_opportunity = C.dv_master_hash_key_h_opportunity