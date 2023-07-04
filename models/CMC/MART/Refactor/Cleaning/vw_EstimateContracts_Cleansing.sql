{{ config(materialized='ephemeral') }}
select 
    OpportunityID,
    profit
from {{ source("DWH", "EstimateContracts") }} ec
where ec.activate = 1 and ec.publishtype != 2 and WFIsFinish = 1
