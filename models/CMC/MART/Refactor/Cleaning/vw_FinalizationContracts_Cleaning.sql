{{ config(materialized='ephemeral') }}
select t.OpportunityID, t.Profit,t.FinalizationContractType
from
    (
        select
            t.*,
            rn = row_number() over (
                partition by t.OpportunityID
                order by t.FinalizationContractType desc, t.ModifiedDate desc
            )
        from {{ source("DWH", "Staging__CMIS_dbo_FinalizationContracts") }} t
        where t.WFIsFinish = 1 and t.Activate = 1

    ) t
where t.rn = 1
