select 
    c.ID as _KEY_CUSTOMER,
    c.Code as [Customer Code]
    ,c.Name as [Customer Name]
    ,c.Address
    ,c.Phone
    ,c.Email
    ,case it.Name 
    {% for Industry in ["Bất động sản", "Sản xuất", "Bán buôn, bán lẻ","Oil & Gas"] %}
            when N'{{Industry}}' then N'{{Industry}}'
    {% endfor %}
            else 'Khác'
        end
    as [Industry Group]
    ,it.Name as Industry 
    ,et.Name as Enviroment 
    ,uc.UserID as AM
    ,IIF(uc.UserID is null, N'Không',N'Có') as [Is There Saleman] 
from {{ source('DWH', 'Staging__CMIS_dbo_Customers') }} c
    left join {{ source('DWH', 'Staging__CMIS_dbo_CustomerTypes') }} ct on c.CustomerTypeID = ct.ID
    left join {{ source('DWH', 'Staging__CMIS_dbo_IndustryTypes') }} it on c.IndustryTypeID = it.ID
    left join {{ source('DWH', 'Staging__CMIS_dbo_EnvironmentTypes') }} et on c.EnvironmentTypeID = et.ID
    left join {{ source('DWH', 'Staging__CMIS_dbo_Customers') }} pr on pr.ID = c.ParentID
	left join {{ source('DWH', 'Staging__CMIS_dbo_UserCustomers') }} uc on c.ID = uc.CustomerID and 
									uc.AccountType=1 and 
									uc.Activate=1