
      
        
            delete from "DWH"."dbo"."dv__r_industrytypes"
            where (
                ID) in (
                select (ID)
                from "DWH"."dbo"."dv__r_industrytypes__dbt_tmp"
            );
        
    

    insert into "DWH"."dbo"."dv__r_industrytypes" ("ID", "Code", "Name", "Year", "Activate", "CreatedDate", "CodeSap", "DV_RECORD_SOURCE", "DV_APPLIED_DATE")
    (
        select "ID", "Code", "Name", "Year", "Activate", "CreatedDate", "CodeSap", "DV_RECORD_SOURCE", "DV_APPLIED_DATE"
        from "DWH"."dbo"."dv__r_industrytypes__dbt_tmp"
    )

  