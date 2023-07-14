
      
        
            delete from "DWH"."dbo"."dv__r_titles"
            where (
                ID) in (
                select (ID)
                from "DWH"."dbo"."dv__r_titles__dbt_tmp"
            );
        
    

    insert into "DWH"."dbo"."dv__r_titles" ("ID", "Code", "Name", "Activate", "CreatedDate", "CreatedByName", "CreatedByID", "Expression", "NameEN", "DV_RECORD_SOURCE", "DV_APPLIED_DATE")
    (
        select "ID", "Code", "Name", "Activate", "CreatedDate", "CreatedByName", "CreatedByID", "Expression", "NameEN", "DV_RECORD_SOURCE", "DV_APPLIED_DATE"
        from "DWH"."dbo"."dv__r_titles__dbt_tmp"
    )

  