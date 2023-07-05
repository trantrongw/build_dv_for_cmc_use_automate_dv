{{ config(materialized='ephemeral') }}
select 
    OpportunityID,
    Profit
from {{ source("DWH", "Staging__CMIS_dbo_EstimateContracts") }} ec
where ec.Activate = 1 and ec.PublishType != 2 and WFIsFinish = 1
