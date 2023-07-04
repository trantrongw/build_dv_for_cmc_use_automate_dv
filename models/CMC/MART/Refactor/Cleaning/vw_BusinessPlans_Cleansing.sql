{{ config(materialized='ephemeral') }}
select
    OpportunityID,
    profit
from {{ source("DWH", "Staging__CMIS_dbo_BusinessPlans") }} businessplans_1
where activate = 1 and publishtype = 1 and WFIsFinish = 1
