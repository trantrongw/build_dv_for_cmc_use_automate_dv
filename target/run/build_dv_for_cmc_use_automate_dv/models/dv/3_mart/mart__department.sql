
  
    
   
   
    

    EXEC('create view "dbo"."mart__department__dbt_tmp_temp_view" as select 
	A.dv_hash_key_h_department as _KEY_DEPARTMENT,
    A.GroupCode as [Department Code],
    A.GroupName as [Department Name]
from "DWH"."dbo"."dv__s_bv_h_department_lastest" A 
WHERE A.IsActive = 1 and A.IsVirtual=0;');


   EXEC('CREATE TABLE "dbo"."mart__department__dbt_tmp" AS (SELECT * FROM "dbo"."mart__department__dbt_tmp_temp_view");');
   
    
    

    
    

    
    

    EXEC('DROP view IF EXISTS "dbo"."mart__department__dbt_tmp_temp_view";');




  