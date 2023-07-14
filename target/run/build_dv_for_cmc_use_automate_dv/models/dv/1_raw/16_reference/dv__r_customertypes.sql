
      
        
            delete from "DWH"."dbo"."dv__r_customertypes"
            where (
                ID) in (
                select (ID)
                from "DWH"."dbo"."dv__r_customertypes__dbt_tmp"
            );
        
    

    insert into "DWH"."dbo"."dv__r_customertypes" ("ID", "Name", "Activate", "Index", "DV_RECORD_SOURCE", "DV_APPLIED_DATE")
    (
        select "ID", "Name", "Activate", "Index", "DV_RECORD_SOURCE", "DV_APPLIED_DATE"
        from "DWH"."dbo"."dv__r_customertypes__dbt_tmp"
    )

  