select 
    c.id as _KEY_CUSTOMER,
    c.Code as [Customer Code]
    ,c.name as [Customer Name]
    ,c.address
    ,c.phone
    ,c.email
    ,case it.name 
    {% for Industry in ["Bất động sản", "Sản xuất", "Bán buôn, bán lẻ","Oil & Gas"] %}
            when N'{{Industry}}' then N'{{Industry}}'
    {% endfor %}
            else 'Khác'
        end
    as [Industry Group]
    ,it.name as Industry 
    ,et.name as Enviroment 
    ,uc.userid as AM
    ,IIF(uc.userid is null, N'Không',N'Có') as [Is There Saleman] 
from {{ source('DWH', 'Staging__CMIS_dbo_Customers') }} c
    inner join {{ source('DWH', 'Staging__CMIS_dbo_CustomerTypes') }} ct on c.CustomerTypeID = ct.ID
    left join {{ source('DWH', 'Staging__CMIS_dbo_industrytypes') }} it on c.industrytypeid = it.id
    left join {{ source('DWH', 'Staging__CMIS_dbo_environmenttypes') }} et on c.environmenttypeid = et.id
    left join {{ source('DWH', 'Staging__CMIS_dbo_customers') }} pr on pr.id = c.parentid
	left join {{ source('DWH', 'Staging__CMIS_dbo_usercustomers') }} uc on c.id = uc.customerid and 
									uc.accounttype=1 and 
									uc.activate=1