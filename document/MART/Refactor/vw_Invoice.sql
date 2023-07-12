WITH 
__dbt__cte__vw_XHD_TongHop
AS (SELECT TRIM(ma_vv) AS OpportunityCode,
           ngay_ct AS INVOICE_DATE,
           SUM(ps_co) - SUM(ps_no) AS TongXuatHD
    FROM {{ source('DWH', 'Staging__CMIS_dbo_ct00') }}
    GROUP BY ma_vv,
             ngay_ct)
             
 ,__dbt__cte__vw_XHD_SumMVV
AS (SELECT OpportunityCode,
           SUM(TongXuatHD) AS sum_tongxuathd,
           COUNT(*) AS TotalRow
    FROM __dbt__cte__vw_XHD_TongHop
    GROUP BY OpportunityCode)
    
SELECT A.OpportunityCode,
       A.INVOICE_DATE,
       A.TongXuatHD,
       A.TongXuatHD / NULLIF(B.sum_tongxuathd, 0) AS PERC
FROM __dbt__cte__vw_XHD_TongHop A
    INNER JOIN __dbt__cte__vw_XHD_SumMVV B
        ON B.OpportunityCode = A.OpportunityCode;