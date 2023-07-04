{% set status = ["1", "2", "3", "4", "5", "6", "7", "8", "9"] %}

{% for statu in status %}
     SELECT A.ID as _KEY_OPP_STATUS,{{statu}} as [OrderStatus], Pipeline=(SELECT TOP (1) Name FROM DEV_CMIS_DWH.dbo.OpportunityStatus T WHERE T.ID = {{statu}} ORDER BY T.ID) 
    FROM DEV_CMIS_DWH.dbo.OpportunityStatus A WHERE A.ID >= {{statu}}
    {%- if not loop.last %} UNION ALL {% endif -%}
{% endfor %}