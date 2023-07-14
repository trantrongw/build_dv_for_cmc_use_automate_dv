
  
    
   
   
    

    EXEC('create view "dbo"."mart__bridge__dbt_tmp_temp_view" as 
    

        (
            select
                cast(''"DWH"."dbo"."mart__customer"'' as VARCHAR(8000)) as Stage,

                
                    cast("_KEY_CUSTOMER" as char(32)) as "_KEY_CUSTOMER" ,
                    cast(null as char(32)) as "_KEY_DEPARTMENT" ,
                    cast(null as char(32)) as "_KEY_EMPLOYEE" ,
                    cast(null as char(32)) as "_KEY_OPP" ,
                    cast(null as date) as "_KEY_OPP_DATE" ,
                    cast(null as bigint) as "_KEY_OPP_STATUS" ,
                    cast(null as char(32)) as "_KEY_PROFIT" ,
                    cast(null as date) as "_KEY_SALE_DATE" ,
                    cast(null as char(32)) as "_KEY_SOLUTION" ,
                    cast(null as char(32)) as "_KEY_SALE" ,
                    cast(null as char(32)) as "_KEY_PLAN" 

            from "DWH"."dbo"."mart__customer"

            
        )

        union all
        

        (
            select
                cast(''"DWH"."dbo"."mart__department"'' as VARCHAR(8000)) as Stage,

                
                    cast(null as char(32)) as "_KEY_CUSTOMER" ,
                    cast("_KEY_DEPARTMENT" as char(32)) as "_KEY_DEPARTMENT" ,
                    cast(null as char(32)) as "_KEY_EMPLOYEE" ,
                    cast(null as char(32)) as "_KEY_OPP" ,
                    cast(null as date) as "_KEY_OPP_DATE" ,
                    cast(null as bigint) as "_KEY_OPP_STATUS" ,
                    cast(null as char(32)) as "_KEY_PROFIT" ,
                    cast(null as date) as "_KEY_SALE_DATE" ,
                    cast(null as char(32)) as "_KEY_SOLUTION" ,
                    cast(null as char(32)) as "_KEY_SALE" ,
                    cast(null as char(32)) as "_KEY_PLAN" 

            from "DWH"."dbo"."mart__department"

            
        )

        union all
        

        (
            select
                cast(''"DWH"."dbo"."mart__employee"'' as VARCHAR(8000)) as Stage,

                
                    cast(null as char(32)) as "_KEY_CUSTOMER" ,
                    cast(null as char(32)) as "_KEY_DEPARTMENT" ,
                    cast("_KEY_EMPLOYEE" as char(32)) as "_KEY_EMPLOYEE" ,
                    cast(null as char(32)) as "_KEY_OPP" ,
                    cast(null as date) as "_KEY_OPP_DATE" ,
                    cast(null as bigint) as "_KEY_OPP_STATUS" ,
                    cast(null as char(32)) as "_KEY_PROFIT" ,
                    cast(null as date) as "_KEY_SALE_DATE" ,
                    cast(null as char(32)) as "_KEY_SOLUTION" ,
                    cast(null as char(32)) as "_KEY_SALE" ,
                    cast(null as char(32)) as "_KEY_PLAN" 

            from "DWH"."dbo"."mart__employee"

            
        )

        union all
        

        (
            select
                cast(''"DWH"."dbo"."mart__opportunity"'' as VARCHAR(8000)) as Stage,

                
                    cast(null as char(32)) as "_KEY_CUSTOMER" ,
                    cast(null as char(32)) as "_KEY_DEPARTMENT" ,
                    cast(null as char(32)) as "_KEY_EMPLOYEE" ,
                    cast("_KEY_OPP" as char(32)) as "_KEY_OPP" ,
                    cast("_KEY_OPP_DATE" as date) as "_KEY_OPP_DATE" ,
                    cast("_KEY_OPP_STATUS" as bigint) as "_KEY_OPP_STATUS" ,
                    cast(null as char(32)) as "_KEY_PROFIT" ,
                    cast(null as date) as "_KEY_SALE_DATE" ,
                    cast(null as char(32)) as "_KEY_SOLUTION" ,
                    cast(null as char(32)) as "_KEY_SALE" ,
                    cast(null as char(32)) as "_KEY_PLAN" 

            from "DWH"."dbo"."mart__opportunity"

            
        )

        union all
        

        (
            select
                cast(''"DWH"."dbo"."mart__profit"'' as VARCHAR(8000)) as Stage,

                
                    cast(null as char(32)) as "_KEY_CUSTOMER" ,
                    cast("_KEY_DEPARTMENT" as char(32)) as "_KEY_DEPARTMENT" ,
                    cast(null as char(32)) as "_KEY_EMPLOYEE" ,
                    cast("_KEY_OPP" as char(32)) as "_KEY_OPP" ,
                    cast(null as date) as "_KEY_OPP_DATE" ,
                    cast(null as bigint) as "_KEY_OPP_STATUS" ,
                    cast("_KEY_PROFIT" as char(32)) as "_KEY_PROFIT" ,
                    cast("_KEY_SALE_DATE" as date) as "_KEY_SALE_DATE" ,
                    cast("_KEY_SOLUTION" as char(32)) as "_KEY_SOLUTION" ,
                    cast(null as char(32)) as "_KEY_SALE" ,
                    cast(null as char(32)) as "_KEY_PLAN" 

            from "DWH"."dbo"."mart__profit"

            
        )

        union all
        

        (
            select
                cast(''"DWH"."dbo"."mart__sale"'' as VARCHAR(8000)) as Stage,

                
                    cast(null as char(32)) as "_KEY_CUSTOMER" ,
                    cast("_KEY_DEPARTMENT" as char(32)) as "_KEY_DEPARTMENT" ,
                    cast(null as char(32)) as "_KEY_EMPLOYEE" ,
                    cast("_KEY_OPP" as char(32)) as "_KEY_OPP" ,
                    cast(null as date) as "_KEY_OPP_DATE" ,
                    cast(null as bigint) as "_KEY_OPP_STATUS" ,
                    cast(null as char(32)) as "_KEY_PROFIT" ,
                    cast("_KEY_SALE_DATE" as date) as "_KEY_SALE_DATE" ,
                    cast("_KEY_SOLUTION" as char(32)) as "_KEY_SOLUTION" ,
                    cast("_KEY_SALE" as char(32)) as "_KEY_SALE" ,
                    cast(null as char(32)) as "_KEY_PLAN" 

            from "DWH"."dbo"."mart__sale"

            
        )

        union all
        

        (
            select
                cast(''"DWH"."dbo"."mart__solution"'' as VARCHAR(8000)) as Stage,

                
                    cast(null as char(32)) as "_KEY_CUSTOMER" ,
                    cast(null as char(32)) as "_KEY_DEPARTMENT" ,
                    cast(null as char(32)) as "_KEY_EMPLOYEE" ,
                    cast(null as char(32)) as "_KEY_OPP" ,
                    cast(null as date) as "_KEY_OPP_DATE" ,
                    cast(null as bigint) as "_KEY_OPP_STATUS" ,
                    cast(null as char(32)) as "_KEY_PROFIT" ,
                    cast(null as date) as "_KEY_SALE_DATE" ,
                    cast("_KEY_SOLUTION" as char(32)) as "_KEY_SOLUTION" ,
                    cast(null as char(32)) as "_KEY_SALE" ,
                    cast(null as char(32)) as "_KEY_PLAN" 

            from "DWH"."dbo"."mart__solution"

            
        )

        union all
        

        (
            select
                cast(''"DWH"."dbo"."mart__plan"'' as VARCHAR(8000)) as Stage,

                
                    cast(null as char(32)) as "_KEY_CUSTOMER" ,
                    cast("_KEY_DEPARTMENT" as char(32)) as "_KEY_DEPARTMENT" ,
                    cast("_KEY_EMPLOYEE" as char(32)) as "_KEY_EMPLOYEE" ,
                    cast(null as char(32)) as "_KEY_OPP" ,
                    cast(null as date) as "_KEY_OPP_DATE" ,
                    cast(null as bigint) as "_KEY_OPP_STATUS" ,
                    cast(null as char(32)) as "_KEY_PROFIT" ,
                    cast("_KEY_SALE_DATE" as date) as "_KEY_SALE_DATE" ,
                    cast("_KEY_SOLUTION" as char(32)) as "_KEY_SOLUTION" ,
                    cast(null as char(32)) as "_KEY_SALE" ,
                    cast("_KEY_PLAN" as char(32)) as "_KEY_PLAN" 

            from "DWH"."dbo"."mart__plan"

            
        )

        ;');


   EXEC('CREATE TABLE "dbo"."mart__bridge__dbt_tmp" AS (SELECT * FROM "dbo"."mart__bridge__dbt_tmp_temp_view");');
   
    
    

    
    

    
    

    EXEC('DROP view IF EXISTS "dbo"."mart__bridge__dbt_tmp_temp_view";');




  