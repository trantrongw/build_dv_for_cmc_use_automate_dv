{{ config(materialized='ephemeral') }}
select
    ContractID,
    sum(Total) as total,
    sum(TotalLockVAT) as totallockvat,
    max(LockDate) as lockdate
from {{ source("DWH", "Staging__CMIS_dbo_ContractLockStatus") }}
where IsLock = 1
group by ContractID
