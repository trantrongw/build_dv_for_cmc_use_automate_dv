

-- Generated by AutomateDV (formerly known as dbtvault)

WITH row_rank_1 AS (
    SELECT dv_hash_key_h_department, department_code, dv_tenant_id, dv_collisioncode, dv_load_timestamp, dv_recordsource
    FROM (
        SELECT rr.dv_hash_key_h_department, rr.department_code, rr.dv_tenant_id, rr.dv_collisioncode, rr.dv_load_timestamp, rr.dv_recordsource,
               ROW_NUMBER() OVER(
                   PARTITION BY rr.dv_hash_key_h_department
                   ORDER BY rr.dv_load_timestamp
               ) AS row_number
        FROM "DWH"."dbo"."hash__cmis_dbo_groups" AS rr
        WHERE rr.dv_hash_key_h_department IS NOT NULL
    ) h
    WHERE h.row_number = 1
),

records_to_insert AS (
    SELECT a.dv_hash_key_h_department, a.department_code, a.dv_tenant_id, a.dv_collisioncode, a.dv_load_timestamp, a.dv_recordsource
    FROM row_rank_1 AS a
    LEFT JOIN "DWH"."dbo"."dv__h_department" AS d
    ON a.dv_hash_key_h_department = d.dv_hash_key_h_department
    WHERE d.dv_hash_key_h_department IS NULL
)

SELECT * FROM records_to_insert