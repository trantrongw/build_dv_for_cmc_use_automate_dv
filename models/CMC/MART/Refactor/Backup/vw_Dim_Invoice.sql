SELECT TRIM(V_XHD.ma_vv) AS INVOICE_OPPORTUNITY_CODE,
       V_XHD.ngay_ct AS INVOICE_DATE,
       SUM(V_XHD.ps_co)-SUM(V_XHD.ps_no) AS INVOICE_VALUE
FROM {{ source('DWH', 'ct00') }} V_XHD
GROUP BY V_XHD.ma_vv,
         V_XHD.ngay_ct