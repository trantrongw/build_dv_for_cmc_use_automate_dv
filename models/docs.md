{% docs V_XHD_CHITIET_V2 %}

Số đã XHĐ (TongXuatHD)
                      SELECT rtrim(b.ma_vv) as OpportunityCode
                                          , sum((COALESCE(b.XuatHoaDon, 0) - COALESCE(b.HBTL, 0))) AS TongXuatHD
                                          , max(b.ngay_ct) ngay_ct
                                      FROM V_XHD_ChiTiet_V2 b 
                                      group by b.ma_vv
                      Select distinct a.ngay_ct , a.so_ct, a.ma_vv, a.ma_kh,  a.XuatHoaDon,  a.HBTL , a.line_nbr
                          From (
                            SELECT   ngay_ct, so_ct, ma_vv, ma_kh, ps_co AS XuatHoaDon, ps_no  AS HBTL, line_nbr
                            FROM            ct00
                            where ((tk like '511%' and tk != '5119' and tk != '5118') or tk like '521%')
                            and (tk_du like '131%' or tk_du like '3387%'or tk_du like '331%'or tk_du like '138%' or tk_du like '335%')
                          ) a


{% enddocs %}

{% docs ContractDetails %}

Chi tiết HĐ
Module: Kinh doanh

{% enddocs %}