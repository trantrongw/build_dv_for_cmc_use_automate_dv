
SELECT ngay_ct,
       so_ct,
       ma_vv,
       ma_kh,
       ps_co AS XuatHoaDon,
       ps_no AS HBTL,
       line_nbr
FROM {{ source('DWH', 'ct00') }}

