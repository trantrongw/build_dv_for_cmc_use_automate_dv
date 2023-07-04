select
    a.id as _KEY_EMPLOYEE,
    concat(concat(a.firstname, ' '), a.lastname) as fullname,
    a.firstname,
    a.lastname,
    a.employeecode,
    case a.gender when 1 then 'Nam' when 0 then 'Nu' end as gender,
    a.active,
    a.beginworkdate,
    b.name as titles
from {{ source("DWH", "Users") }} a
left join {{ source("DWH", "Titles") }} b on a.titleid = b.id
