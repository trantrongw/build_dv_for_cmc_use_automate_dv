SELECT TRIM(b.INVOICE_OPPORTUNITY_CODE) AS OpportunityCode,
           b.INVOICE_DATE,
           ((COALESCE(b.INVOICE_VALUE, 0) - COALESCE(b.INVOICE_HBTL, 0))) AS TongXuatHD
    FROM {{ref('V_Dim_Invoice')}} b