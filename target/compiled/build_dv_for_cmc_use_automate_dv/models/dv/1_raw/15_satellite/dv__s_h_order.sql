
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (
    SELECT a.dv_hash_key_h_order, a.dv_hashdiff_s_h_order, a.[Activate], a.[CreatedDate], a.[TotalBeforeVAT], a.dv_load_timestamp, a.dv_recordsource
    FROM "DWH"."dbo"."hash__cmis_dbo_orders" AS a
    WHERE a.dv_hash_key_h_order IS NOT NULL
),

latest_records AS (
    SELECT a.dv_hash_key_h_order, a.dv_hashdiff_s_h_order, a.dv_load_timestamp
    FROM (
        SELECT current_records.dv_hash_key_h_order, current_records.dv_hashdiff_s_h_order, current_records.dv_load_timestamp,
            RANK() OVER (
               PARTITION BY current_records.dv_hash_key_h_order
               ORDER BY current_records.dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_h_order" AS current_records
            JOIN (
                SELECT DISTINCT source_data.dv_hash_key_h_order
                FROM source_data
            ) AS source_records
                ON current_records.dv_hash_key_h_order = source_records.dv_hash_key_h_order
    ) AS a
    WHERE a.rank = 1
),

records_to_insert AS (
    SELECT DISTINCT stage.dv_hash_key_h_order, stage.dv_hashdiff_s_h_order, stage.[Activate], stage.[CreatedDate], stage.[TotalBeforeVAT], stage.dv_load_timestamp, stage.dv_recordsource
    FROM source_data AS stage
    LEFT JOIN latest_records
    ON latest_records.dv_hash_key_h_order = stage.dv_hash_key_h_order
        AND latest_records.dv_hashdiff_s_h_order = stage.dv_hashdiff_s_h_order
    WHERE latest_records.dv_hashdiff_s_h_order IS NULL
)

SELECT * FROM records_to_insert