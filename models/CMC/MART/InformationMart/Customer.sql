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
from {{ source('DWH', 'customers') }} c
    inner join {{ source('DWH', 'CustomerTypes') }} ct on c.CustomerTypeID = ct.ID
    left join {{ source('DWH', 'industrytypes') }} it on c.industrytypeid = it.id
    left join {{ source('DWH', 'environmenttypes') }} et on c.environmenttypeid = et.id
    left join {{ source('DWH', 'customers') }} pr on pr.id = c.parentid
	left join {{ source('DWH', 'usercustomers') }} uc on c.id = uc.customerid and 
									uc.accounttype=1 and 
									uc.activate=1