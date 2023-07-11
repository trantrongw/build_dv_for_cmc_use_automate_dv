{{ config(
        materialized='incremental', 
        unique_key='ID',
        incremental_strategy='delete+insert'
        )
    }}

SELECT  *
FROM {{ ref('stg__cmis_dbo_environmenttypes') }}
