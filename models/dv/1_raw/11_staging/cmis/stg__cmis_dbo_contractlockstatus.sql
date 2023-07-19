select 
{% if target.name == 'dev' %} top 0 {% endif %}
* 
from {{ source('DWH', 'Staging__CMIS_dbo_ContractLockStatus') }}