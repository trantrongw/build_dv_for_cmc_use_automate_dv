  select
    View1.ngay_ct as INVOICE_DATE
    ,TRIM(View1.ma_vv) INVOICE_OPPORTUNITY_CODE
    ,View1.SumXHD INVOICE_VALUE
    ,View1.SumHBTL INVOICE_HBTL
    from
    (
        select 
        --INVOICE_OPPORTUNITY_CODE
        V_XHD.ma_vv
        --INVOICE_DATE
        ,V_XHD.ngay_ct
        --INVOICE_VALUE
        ,sum(V_XHD.XuatHoaDon) as SumXHD
        --INVOICE_HBTL
        ,sum(V_XHD.HBTL) as SumHBTL

        from {{ref('V_XHD_CHITIET_V2')}} V_XHD

        group by V_XHD.ma_vv,V_XHD.ngay_ct
    ) View1
    where TRIM(View1.ma_vv) is not null