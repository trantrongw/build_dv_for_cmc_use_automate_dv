{{ config(materialized='ephemeral') }}
select
    contractid,
    sum(total) as total,
    sum(totallockvat) as totallockvat,
    max(lockdate) as lockdate
from {{ source("DWH", "ContractLockStatus") }}
where islock = 1
group by contractid
