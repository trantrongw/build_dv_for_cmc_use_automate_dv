{{ config(materialized='ephemeral') }}
select
    OpportunityID,
    profit
from {{ source("DWH", "BusinessPlans") }} businessplans_1
where activate = 1 and publishtype = 1 and WFIsFinish = 1
