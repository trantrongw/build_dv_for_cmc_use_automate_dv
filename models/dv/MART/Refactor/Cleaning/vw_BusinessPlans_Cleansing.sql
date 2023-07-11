{{ config(materialized='ephemeral') }}
select
    OpportunityID,
    Profit
from {{ source("DWH", "Staging__CMIS_dbo_BusinessPlans") }} businessplans_1
where Activate = 1 and PublishType = 1 and WFIsFinish = 1
