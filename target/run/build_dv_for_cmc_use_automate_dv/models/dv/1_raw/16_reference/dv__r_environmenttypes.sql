
      
        
            delete from "DWH"."dbo"."dv__r_environmenttypes"
            where (
                ID) in (
                select (ID)
                from "DWH"."dbo"."dv__r_environmenttypes__dbt_tmp"
            );
        
    

    insert into "DWH"."dbo"."dv__r_environmenttypes" ("ID", "Code", "Name", "Year", "Activate", "CreatedDate", "DV_RECORD_SOURCE", "DV_APPLIED_DATE")
    (
        select "ID", "Code", "Name", "Year", "Activate", "CreatedDate", "DV_RECORD_SOURCE", "DV_APPLIED_DATE"
        from "DWH"."dbo"."dv__r_environmenttypes__dbt_tmp"
    )

  