select 
	MVV_ID
	,MVV
	,QTDA_IsFinish
	,QTT_IsFinish
	,DTHD_IsFinish
	,PAKD_IsFinish
	,QTHD_TrangThai
	,QTT_TrangThai
	,DTHD_TrangThai
	,PAKD_TrangThai
	,QTTK_IsFinish
	,QTTKT_IsFinish
	,DTTK_IsFinish
	--,(CASE
	--	WHEN QTTK_IsFinish =1 THEN QTTK
	--	WHEN DTTK_IsFinish = 1 THEN DTTK ELSE NULL END) AS TrangThaiTrienKhai
	,(CASE 		
		WHEN QTDA_IsFinish = 1 THEN 'QTDA'
		WHEN QTT_IsFinish = 1 THEN 'QTT'
		WHEN DTHD_IsFinish = 1 THEN 'DTHD '
		WHEN PAKD_IsFinish= 1 THEN 'PAKD' ELSE '' END) AS TrangThai
	,(CASE
		WHEN QTTK_IsFinish = 1 THEN 'QTTK'
		WHEN QTTKT_IsFinish = 1 THEN 'QTTKT'
		WHEN DTTK_IsFinish = 1 THEN 'DTTK' ELSE NULL END) AS TrangThaiTrienKhai
	,(CASE 
		--WHEN QTDA_IsFinish = 1 and (QTT_IsFinish != 1 or QTT_IsFinish is null) THEN QTDA_TotalMarketing
		WHEN QTDA_IsFinish = 1 THEN QTDA_TotalMarketing --ntttrang 18042018
		--WHEN QTDA_IsFinish = 1 and QTT_IsFinish = 1 THEN QTDA_TotalMarketing - QTT_TotalMarketing
		--WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN DTHD_TotalMarketing - QTT_TotalMarketing
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_TotalMarketing  -- yêu cầu thay đổi ltdung, ldhoa: 17042018
		WHEN DTHD_IsFinish = 1 THEN DTHD_TotalMarketing 
		WHEN PAKD_IsFinish= 1 THEN PAKD_TotalMarketing ELSE 0 END) AS CPMarketing
	,(CASE 
		--WHEN QTDA_IsFinish = 1 THEN QTDA_DVMN
		--WHEN QTDA_IsFinish = 1 and (QTT_IsFinish != 1 or QTT_IsFinish is null) THEN QTDA_DVMN
		WHEN QTDA_IsFinish = 1 THEN QTDA_DVMN --ntttrang 18042018
		--WHEN QTDA_IsFinish = 1 and QTT_IsFinish = 1 THEN QTDA_DVMN - QTT_DVMN
		--WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN DTHD_DVMN - QTT_DVMN
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_DVMN  -- yêu cầu thay đổi ltdung, ldhoa: 17042018
		WHEN DTHD_IsFinish = 1 THEN DTHD_DVMN 
		WHEN PAKD_IsFinish= 1 THEN PAKD_DVMN ELSE 0 END) AS DVMN
	,(CASE 
		--WHEN QTDA_IsFinish = 1 THEN QTHD_CPNC
		--WHEN QTDA_IsFinish = 1 and (QTT_IsFinish != 1 or QTT_IsFinish is null) THEN QTHD_CPNC
		WHEN QTDA_IsFinish = 1 THEN QTHD_CPNC --ntttrang 18042018
		--WHEN QTDA_IsFinish = 1 and QTT_IsFinish = 1 THEN QTHD_CPNC - QTT_CPNC
		--WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN DTHD_CPNC - QTT_CPNC
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_CPNC -- yêu cầu thay đổi ltdung, ldhoa: 17042018
		WHEN DTHD_IsFinish = 1 THEN DTHD_CPNC ELSE 0 END) AS CPNC
	,(CASE WHEN DTTV_IsFinish = 1 THEN DTTV_CPNC ELSE 0 END) AS CPNCTV
	,(CASE 
		WHEN QTTK_IsFinish = 1 THEN QTTK_CPNCTK 
		WHEN QTTKT_IsFinish = 1 THEN QTTKT_CPNCTK
		WHEN DTTK_IsFinish = 1 THEN DTTK_CPNCTK ELSE 0 END) AS CPNCTK
	,(CASE 
		--WHEN QTDA_IsFinish = 1 THEN QTDA_LaiGop
		--WHEN QTDA_IsFinish = 1 and (QTT_IsFinish != 1 or QTT_IsFinish is null) THEN QTDA_LaiGop
		WHEN QTDA_IsFinish = 1 THEN QTDA_LaiGop --ntttrang 18042018
		--WHEN QTDA_IsFinish = 1 and QTT_IsFinish = 1 THEN QTDA_LaiGop - QTT_LaiGop
		--WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN DTHD_LaiGop - QTT_LaiGop
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_LaiGop -- yêu cầu thay đổi ltdung, ldhoa: 17042018
		WHEN DTHD_IsFinish = 1 THEN DTHD_LaiGop 
		WHEN PAKD_IsFinish= 1 THEN PAKD_LaiGop ELSE 0 END) AS LaiGop
	,(CASE 
		WHEN QTDA_IsFinish = 1 THEN QTDA_LaiThuanV2
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_LaiGopV2
		WHEN DTHD_IsFinish = 1 THEN DTHD_LaiGopV2 
		WHEN PAKD_IsFinish= 1 THEN PAKD_LaiGopV2 ELSE 0 END) AS LaiGopV2
	,(CASE 
		--WHEN QTDA_IsFinish = 1 THEN QTDA_LaiThuan
		--WHEN QTDA_IsFinish = 1 and (QTT_IsFinish != 1 or QTT_IsFinish is null) THEN QTDA_LaiThuan
		WHEN QTDA_IsFinish = 1 THEN QTDA_LaiThuan --ntttrang 18042018
		--WHEN QTDA_IsFinish = 1 and QTT_IsFinish = 1 THEN QTDA_LaiThuan - QTT_LaiThuan
		--WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN DTHD_LaiThuan - QTT_LaiThuan
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_LaiThuan -- yêu cầu thay đổi ltdung, ldhoa: 17042018
		WHEN DTHD_IsFinish = 1 THEN DTHD_LaiThuan 
		WHEN PAKD_IsFinish= 1 THEN PAKD_LaiThuan ELSE 0 END) AS LaiThuan
	,(CASE 
		WHEN QTDA_IsFinish = 1 THEN QTDA_LaiThuanV2
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_LaiThuanV2
		WHEN DTHD_IsFinish = 1 THEN DTHD_LaiThuanV2 
		WHEN PAKD_IsFinish= 1 THEN PAKD_LaiThuanV2 ELSE 0 END) AS LaiThuanV2
	,(CASE 
		--WHEN QTDA_IsFinish = 1 THEN QTDA_CPTC
		--WHEN QTDA_IsFinish = 1 and (QTT_IsFinish != 1 or QTT_IsFinish is null) THEN QTDA_CPTC
		WHEN QTDA_IsFinish = 1 THEN QTDA_CPTC --ntttrang 18042018
		--WHEN QTDA_IsFinish = 1 and QTT_IsFinish = 1 THEN QTDA_CPTC - QTT_CPTC
		--WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN DTHD_CPTC - QTT_CPTC
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_CPTC -- yêu cầu thay đổi ltdung, ldhoa: 17042018
		WHEN DTHD_IsFinish = 1 THEN DTHD_CPTC 
		WHEN PAKD_IsFinish= 1 THEN PAKD_CPTC ELSE 0 END) AS CPTC
	,(CASE WHEN DTTV_IsFinish = 1 THEN DTTV_CPTV_BangTien ELSE 0 END) AS CPTV_BangTien	
	,(CASE 
		WHEN QTTK_IsFinish = 1 THEN QTTK_CPTK_BangTien 
		WHEN QTTKT_IsFinish = 1 THEN QTTKT_CPTK_BangTien
		WHEN DTTK_IsFinish = 1 THEN DTTK_CPTK_BangTien ELSE 0 END) AS CPTK_BangTien
	,(CASE 
		WHEN QTDA_IsFinish = 1 THEN QTDA_GVHBKH 
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_GVHBKH
		WHEN DTHD_IsFinish = 1 THEN DTHD_GVHBKH
		WHEN PAKD_IsFinish= 1 THEN PAKD_GVHBKH ELSE 0 END) AS GIAVON
	,(CASE 
		WHEN QTDA_IsFinish = 1 THEN (QTHD_GVBHCT + QTHD_CPTBHC + QTHD_CPBHGT)
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN (QTT_GVBHCT + QTT_CPTBHC + QTT_CPBHGT)
		WHEN DTHD_IsFinish = 1 THEN (DTHD_GVBHCT + DTHD_CPTBHC + DTHD_CPBHGT)
		WHEN PAKD_IsFinish= 1 THEN (PAKD_GVBHCT + PAKD_CPTBHC + PAKD_CPBHGT) ELSE 0 END) AS CPBH -- ntpquyen: 2021-05-25: bo sung CP bao hanh
	,(CASE 
		WHEN QTDA_IsFinish = 1 THEN QTHD_CPK 
		WHEN (QTDA_IsFinish != 1 or QTDA_IsFinish is null) and QTT_IsFinish = 1 THEN QTT_CPK
		WHEN DTHD_IsFinish = 1 THEN DTHD_CPK
		WHEN PAKD_IsFinish= 1 THEN PAKD_CPK ELSE 0 END) AS CPK  -- ntpquyen: 2021-05-25: bo sung CP khac


	from {{ref('V_MVV_QT_DT_PA_ChiTietV2')}} 