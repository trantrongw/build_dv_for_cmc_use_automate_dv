{{ config(materialized='ephemeral') }}
SELECT TRIM(ma_vv) AS OpportunityCode,ngay_ct AS INVOICE_DATE,SUM(ps_co) - SUM(ps_no) AS TongXuatHD
    FROM  {{ source('DWH', 'Staging__CMIS_dbo_ct00') }}
    GROUP BY ma_vv,ngay_ct