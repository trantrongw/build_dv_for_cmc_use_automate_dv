
      insert into "DWH"."dbo"."dv__s_h_opportunity" ("dv_hash_key_h_opportunity", "dv_hashdiff_s_h_opportunity", "CustomerID", "SaleManID", "OpportunityType", "GroupID", "EstimateRevenue", "StatusID", "PublishType", "Activate", "IsDeleted", "ParentID", "BusinessOpportunityID", "CreatedDate", "dv_load_timestamp", "dv_recordsource")
    (
        select "dv_hash_key_h_opportunity", "dv_hashdiff_s_h_opportunity", "CustomerID", "SaleManID", "OpportunityType", "GroupID", "EstimateRevenue", "StatusID", "PublishType", "Activate", "IsDeleted", "ParentID", "BusinessOpportunityID", "CreatedDate", "dv_load_timestamp", "dv_recordsource"
        from "DWH"."dbo"."dv__s_h_opportunity__dbt_tmp"
    )


  