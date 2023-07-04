SELECT        Contracts.OpportunityID AS MVV_ID, Contracts.TotalBeforeVAT AS DoanhSoHD -- Doanh so hop dong truoc khi khoa
			, ContractLockStatus.Total AS GTHDKhoa -- Gia tri khoa hop dong
			, ContractLockStatus.TotalLockVAT AS GTHDKhoaVAT -- Gia tri khoa hop dong sau thue
			, ContractLockStatus.LockDate AS NgayGhiNhanDoanhSo, ContractLockTypes.Name AS TrangThaiGhiNhan, Contracts.ID AS ContractID
			, (case when FinalizationContracts.Revenue > 0 then FinalizationContracts.Revenue else ContractLockStatus.Total end) AS DSGhiNhan -- Doanh so thuc / doanh so quyet toan
			, Contracts.LockDate AS NgayKhoaHD -- ngay khoa hop dong
FROM        {{ source('DWH', 'Contracts') }} 
			INNER JOIN (
				select ContractID, LockType, sum(Total) as Total, sum(TotalLockVAT) as TotalLockVAT, max(LockDate) as LockDate
				from {{ source('DWH', 'ContractLockStatus') }}
				where IsLock = 1
				group by ContractID, LockType
			) ContractLockStatus ON Contracts.ID = ContractLockStatus.ContractID
			LEFT JOIN {{ source('DWH', 'ContractLockTypes') }} ON ContractLockTypes.ID = ContractLockStatus.LockType
			LEFT JOIN
				(
					SELECT   a.OpportunityID, a.Revenue
					FROM {{ source('DWH', 'FinalizationContracts') }} a 
					INNER JOIN 
					(
						SELECT OpportunityID, MAX(ModifiedDate) AS ModifiedDate
						FROM {{ source('DWH', 'FinalizationContracts') }} b WHERE WFIsFinish = 1 AND Activate = 1 AND FinalizationContractType > 1  -- Lay QT That (1: tam, > 1: That)
						GROUP BY OpportunityID
					) x ON x.OpportunityID = a.OpportunityID AND a.ModifiedDate = x.ModifiedDate
				) FinalizationContracts ON Contracts.OpportunityID = FinalizationContracts.OpportunityID
WHERE       (Contracts.Activate = 1)