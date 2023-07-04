SELECT 
    CONVERT(
                  VARCHAR(32),
                  HASHBYTES('MD5',CONCAT_WS('$',B.ID,A.ngay_ct))
              ) AS _KEY_INVOICE
    ,B.ID AS _KEY_OPP,
    CAST(A.ngay_ct AS DATE) AS _KEY_INVOICE_DATE,
    SUM(A.ps_co) - SUM(A.ps_no) AS [Invoice Amount]
FROM dbo.ct00 A
    INNER JOIN dbo.Opportunities B
        ON TRIM(A.ma_vv) = B.Code
GROUP BY B.ID,
         A.ngay_ct