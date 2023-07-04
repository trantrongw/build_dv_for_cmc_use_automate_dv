{{ config(materialized='ephemeral') }}
SELECT opportunitycode, SUM(TongXuatHD) AS sum_tongxuathd,count(*) as TotalRow
    FROM  {{ ref("vw_XHD_TongHop") }}
    GROUP BY opportunitycode