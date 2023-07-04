with cteP as (
      Select ID, ParentID
            ,[HIERARCHYPATH] = convert(varchar(500),ID)
            ,[HierID]        = convert(hierarchyid,concat('/',ID,'/'))
      From   {{ source('DWH', 'Groups') }} 
      Where  ParentID is null
      Union  All
      Select r.ID, r.ParentID
            ,[HIERARCHYPATH]     = convert(varchar(500),concat(p.[HIERARCHYPATH],' \ ',r.ID))
            ,[HierID]            = convert(hierarchyid,concat(p.HierID.ToString(),r.ID,'/'))
      From   {{ source('DWH', 'Groups') }}   r
      Join   cteP p on r.ParentID  = p.ID),
Paths as
(
Select ID
      ,ParentID
      ,[HIERARCHYPATH] as [Path]
 From cteP A
),
Levels
as
(
select *, 
	[PowerBI].GetStringPartByDelimeter([Path], '\', 1)  as Level1,
	[PowerBI].GetStringPartByDelimeter([Path], '\', 2)  as Level2,
	[PowerBI].GetStringPartByDelimeter([Path], '\', 3)  as Level3,
	[PowerBI].GetStringPartByDelimeter([Path], '\', 4)  as Level4,
	[PowerBI].GetStringPartByDelimeter([Path], '\', 5)  as Level5,
	[PowerBI].GetStringPartByDelimeter([Path], '\', 6)  as Level6
FROM
	Paths
)
select 
	A.ID as _KEY_DEPARTMENT,
    A.GroupCode as [Department Code],
    A.GroupName as [Department Name],
	lv1.GroupCode as [Department Code Level 1],
	lv2.GroupCode as [Department Code Level 2],
	lv3.GroupCode as [Department Code Level 3],
	lv4.GroupCode as [Department Code Level 4],
	lv5.GroupCode as [Department Code Level 5],
	lv6.GroupCode as [Department Code Level 6]

from {{ source('DWH', 'Groups') }}  A 
	left join Levels B on A.ID = B.ID
	left join {{ source('DWH', 'Groups') }}  lv1 on B.Level1 = lv1.ID
	left join {{ source('DWH', 'Groups') }}  lv2 on B.Level2 = lv2.ID
	left join {{ source('DWH', 'Groups') }}  lv3 on B.Level3 = lv3.ID
	left join {{ source('DWH', 'Groups') }}  lv4 on B.Level4 = lv4.ID
	left join {{ source('DWH', 'Groups') }}  lv5 on B.Level5 = lv5.ID
	left join {{ source('DWH', 'Groups') }}  lv6 on B.Level6 = lv6.ID
where A.isactive = 1 and A.IsVirtual=0 