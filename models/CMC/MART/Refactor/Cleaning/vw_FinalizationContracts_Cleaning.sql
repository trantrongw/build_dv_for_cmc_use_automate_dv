{{ config(materialized='ephemeral') }}
select t.opportunityid, t.profit,t.finalizationcontracttype
from
    (
        select
            t.*,
            rn = row_number() over (
                partition by t.opportunityid
                order by t.finalizationcontracttype desc, t.modifieddate desc
            )
        from {{ source("DWH", "FinalizationContracts") }} t
        where t.wfisfinish = 1 and t.activate = 1

    ) t
where t.rn = 1
