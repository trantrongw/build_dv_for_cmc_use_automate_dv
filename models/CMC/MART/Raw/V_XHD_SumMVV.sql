SELECT vv.OpportunityCode,
           SUM(vv.TongXuatHD) AS Sum_TongXuatHD
    FROM
    (
        SELECT RTRIM(b.INVOICE_OPPORTUNITY_CODE) AS OpportunityCode,
               ((COALESCE(b.INVOICE_VALUE, 0) - COALESCE(b.INVOICE_HBTL, 0))) AS TongXuatHD,
               b.INVOICE_DATE
        FROM {{ref('V_Dim_Invoice')}} b
    ) vv
    GROUP BY vv.OpportunityCode