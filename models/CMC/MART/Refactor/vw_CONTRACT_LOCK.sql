SELECT
			A.OpportunityID AS MVV_ID
			, B.LockDate AS NgayGhiNhanDoanhSo
			, B.Total AS GTHDKhoa -- Gia tri khoa hop dong
FROM        {{ source('DWH', 'Contracts') }} A
			INNER JOIN {{ ref("vw_ContractLockStatus_Cleaning") }} B 
				ON A.ID = B.ContractID
WHERE       (A.Activate = 1)