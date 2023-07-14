
  
    
   
   
    

    EXEC('create view "dbo"."mart__pipeline__dbt_tmp_temp_view" as 


     SELECT A.ID as _KEY_OPP_STATUS,1 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 1 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 1 UNION ALL 
     SELECT A.ID as _KEY_OPP_STATUS,2 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 2 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 2 UNION ALL 
     SELECT A.ID as _KEY_OPP_STATUS,3 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 3 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 3 UNION ALL 
     SELECT A.ID as _KEY_OPP_STATUS,4 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 4 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 4 UNION ALL 
     SELECT A.ID as _KEY_OPP_STATUS,5 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 5 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 5 UNION ALL 
     SELECT A.ID as _KEY_OPP_STATUS,6 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 6 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 6 UNION ALL 
     SELECT A.ID as _KEY_OPP_STATUS,7 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 7 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 7 UNION ALL 
     SELECT A.ID as _KEY_OPP_STATUS,8 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 8 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 8 UNION ALL 
     SELECT A.ID as _KEY_OPP_STATUS,9 as [OrderStatus]
        , Pipeline=(
                        SELECT TOP (1) Name 
                        FROM "DWH"."dbo"."dv__r_opportunitystatus"  T 
                        WHERE T.ID = 9 ORDER BY T.ID
                    ) 
    FROM "DWH"."dbo"."dv__r_opportunitystatus" A WHERE A.ID >= 9;');


   EXEC('CREATE TABLE "dbo"."mart__pipeline__dbt_tmp" AS (SELECT * FROM "dbo"."mart__pipeline__dbt_tmp_temp_view");');
   
    
    

    
    

    
    

    EXEC('DROP view IF EXISTS "dbo"."mart__pipeline__dbt_tmp_temp_view";');




  