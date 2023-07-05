{{ config(materialized='ephemeral') }}
select
    ContractID,
    sum(Total) as Total,
    sum(TotalLockVAT) as TotalLockVAT,
    max(LockDate) as LockDate
from {{ source("DWH", "Staging__CMIS_dbo_ContractLockStatus") }}
where IsLock = 1
group by ContractID
