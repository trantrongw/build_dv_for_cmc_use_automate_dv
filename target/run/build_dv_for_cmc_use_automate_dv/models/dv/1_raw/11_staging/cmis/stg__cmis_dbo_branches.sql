
    

    EXEC('create view "dbo"."stg__cmis_dbo_branches__dbt_tmp" as select 
ID,
Code,
Name,
Description,
PublishType,
Activate,
IsDeleted,
CreatedDate,
ParentID,
ADN,
LastChildADN,
BaseSource,
LastUpdateBase,
PercentProfit,
IsDisplay,
Color,
IsSBAService,
IsSBARetail,
IsSBALicense,
IsSBAServiceRetail,
DV_RECORD_SOURCE,
DV_APPLIED_DATE 
from "DWH"."dbo"."Staging__CMIS_dbo_Branches";');

