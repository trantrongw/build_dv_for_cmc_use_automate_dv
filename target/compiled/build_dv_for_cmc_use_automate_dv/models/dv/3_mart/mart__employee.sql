select
    a.dv_hash_key_h_user as _KEY_EMPLOYEE,
    concat(concat(a.FirstName, ' '), a.LastName) as fullname,
    a.FirstName,
    a.LastName,
    a.EmployeeCode,
    case a.Gender when 1 then 'Nam' when 0 then 'Nu' end as gender,
    a.Active,
    a.BeginWorkDate,
    b.Name as titles
from "DWH"."dbo"."dv__s_bv_h_user_lastest" a
left join "DWH"."dbo"."dv__r_titles" b on a.TitleID = b.ID