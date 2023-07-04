select
    a.ID as _KEY_EMPLOYEE,
    concat(concat(a.FirstName, ' '), a.LastName) as fullname,
    a.FirstName,
    a.LastName,
    a.EmployeeCode,
    case a.Gender when 1 then 'Nam' when 0 then 'Nu' end as gender,
    a.Active,
    a.BeginWorkDate,
    b.Name as titles
from {{ source("DWH", "Staging__CMIS_dbo_Users") }} a
left join {{ source("DWH", "Staging__CMIS_dbo_Titles") }} b on a.TitleId = b.id
