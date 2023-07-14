
      
        
            delete from "DWH"."dbo"."dv__r_opportunitystatus"
            where (
                ID) in (
                select (ID)
                from "DWH"."dbo"."dv__r_opportunitystatus__dbt_tmp"
            );
        
    

    insert into "DWH"."dbo"."dv__r_opportunitystatus" ("ID", "Code", "Name", "Description", "PublishType", "Activate", "IsDeleted", "CreatedDate", "Percent", "Note", "Stage", "OrderCusPriority", "DV_RECORD_SOURCE", "DV_APPLIED_DATE")
    (
        select "ID", "Code", "Name", "Description", "PublishType", "Activate", "IsDeleted", "CreatedDate", "Percent", "Note", "Stage", "OrderCusPriority", "DV_RECORD_SOURCE", "DV_APPLIED_DATE"
        from "DWH"."dbo"."dv__r_opportunitystatus__dbt_tmp"
    )

  