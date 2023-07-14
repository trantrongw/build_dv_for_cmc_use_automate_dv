
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (
    SELECT a.dv_hash_key_h_opportunity, a.dv_hashdiff_s_h_opportunity, a.[CustomerID], a.[SaleManID], a.[OpportunityType], a.[GroupID], a.[EstimateRevenue], a.[StatusID], a.[PublishType], a.[Activate], a.[IsDeleted], a.[ParentID], a.[BusinessOpportunityID], a.[CreatedDate], a.dv_load_timestamp, a.dv_recordsource
    FROM "DWH"."dbo"."hash__cmis_dbo_opportunities" AS a
    WHERE a.dv_hash_key_h_opportunity IS NOT NULL
),

latest_records AS (
    SELECT a.dv_hash_key_h_opportunity, a.dv_hashdiff_s_h_opportunity, a.dv_load_timestamp
    FROM (
        SELECT current_records.dv_hash_key_h_opportunity, current_records.dv_hashdiff_s_h_opportunity, current_records.dv_load_timestamp,
            RANK() OVER (
               PARTITION BY current_records.dv_hash_key_h_opportunity
               ORDER BY current_records.dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_h_opportunity" AS current_records
            JOIN (
                SELECT DISTINCT source_data.dv_hash_key_h_opportunity
                FROM source_data
            ) AS source_records
                ON current_records.dv_hash_key_h_opportunity = source_records.dv_hash_key_h_opportunity
    ) AS a
    WHERE a.rank = 1
),

records_to_insert AS (
    SELECT DISTINCT stage.dv_hash_key_h_opportunity, stage.dv_hashdiff_s_h_opportunity, stage.[CustomerID], stage.[SaleManID], stage.[OpportunityType], stage.[GroupID], stage.[EstimateRevenue], stage.[StatusID], stage.[PublishType], stage.[Activate], stage.[IsDeleted], stage.[ParentID], stage.[BusinessOpportunityID], stage.[CreatedDate], stage.dv_load_timestamp, stage.dv_recordsource
    FROM source_data AS stage
    LEFT JOIN latest_records
    ON latest_records.dv_hash_key_h_opportunity = stage.dv_hash_key_h_opportunity
        AND latest_records.dv_hashdiff_s_h_opportunity = stage.dv_hashdiff_s_h_opportunity
    WHERE latest_records.dv_hashdiff_s_h_opportunity IS NULL
)

SELECT * FROM records_to_insert