Select distinct a.ngay_ct , a.so_ct, a.ma_vv, a.ma_kh,  a.XuatHoaDon,  a.HBTL , a.line_nbr
	From (
	  SELECT   ngay_ct, so_ct, ma_vv, ma_kh, ps_co AS XuatHoaDon, ps_no  AS HBTL, line_nbr
	  FROM {{ source('DWH', 'ct00') }}
	 ) a