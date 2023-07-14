
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (
    SELECT a.dv_hash_key_l_opportunity_invoice, a.dv_hashdiff_s_l_opportunity_invoice, a.[ngay_ct], a.[ps_co], a.[ps_no], a.dv_load_timestamp, a.dv_recordsource
    FROM "DWH"."dbo"."hash__cmis_dbo_ct00" AS a
    WHERE a.dv_hash_key_l_opportunity_invoice IS NOT NULL
),

latest_records AS (
    SELECT a.dv_hash_key_l_opportunity_invoice, a.dv_hashdiff_s_l_opportunity_invoice, a.dv_load_timestamp
    FROM (
        SELECT current_records.dv_hash_key_l_opportunity_invoice, current_records.dv_hashdiff_s_l_opportunity_invoice, current_records.dv_load_timestamp,
            RANK() OVER (
               PARTITION BY current_records.dv_hash_key_l_opportunity_invoice
               ORDER BY current_records.dv_load_timestamp DESC
            ) AS rank
        FROM "DWH"."dbo"."dv__s_l_opportunity_invoice" AS current_records
            JOIN (
                SELECT DISTINCT source_data.dv_hash_key_l_opportunity_invoice
                FROM source_data
            ) AS source_records
                ON current_records.dv_hash_key_l_opportunity_invoice = source_records.dv_hash_key_l_opportunity_invoice
    ) AS a
    WHERE a.rank = 1
),

records_to_insert AS (
    SELECT DISTINCT stage.dv_hash_key_l_opportunity_invoice, stage.dv_hashdiff_s_l_opportunity_invoice, stage.[ngay_ct], stage.[ps_co], stage.[ps_no], stage.dv_load_timestamp, stage.dv_recordsource
    FROM source_data AS stage
    LEFT JOIN latest_records
    ON latest_records.dv_hash_key_l_opportunity_invoice = stage.dv_hash_key_l_opportunity_invoice
        AND latest_records.dv_hashdiff_s_l_opportunity_invoice = stage.dv_hashdiff_s_l_opportunity_invoice
    WHERE latest_records.dv_hashdiff_s_l_opportunity_invoice IS NULL
)

SELECT * FROM records_to_insert