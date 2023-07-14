
    

    EXEC('create view "dbo"."stg__cmis_dbo_users__dbt_tmp" as with source as (
      select * from "DWH"."dbo"."Staging__CMIS_dbo_Users"
),
renamed as (
    select
        "ID",
        "Email",
        "Password",
        "FirstName",
        "LastName",
        "EmployeeCode",
        "Image",
        "Thumb",
        "DOB",
        "Gender",
        "Address",
        "Phone",
        "Active",
        "Display",
        "CreatedDate",
        "CreatedByName",
        "CreatedByID",
        "TitleID",
        "UserName",
        "ContractDate",
        "BeginWorkDate",
        "LoyaltyYear",
      
        "ModifiedDate",
        "ModifiedByID",
        "ModifiedByName",
        "IsIntership",
        "TitleText",
        "WeightUser",
        "EmployeeTypeID",
        "About",
        "Facebook",
        "Twitter",
        "GooglePlus",
        "History",
        "IsShowContact",
        "KPIEmployeeTypeID",
        "QuitDate",
        "IsExternal",
        "UserType",
        "TokenKey",
        "EndContractDate",
        "HRCandidateID",
        "AltEmail",
        "AltPassword",
        "AltUserName",
        "SocialInsuranceNumber",
        "Certificate",
        "IdentityCardNumber",
        "IdentityCardDate",
        "IdentityCardPlace",
        "CompanyID",
        "LocationID",
        "WorkTime",
        "LevelText",
        "Major",
        "School",
        "CurrentAdress",
        "GroupTypeID",
        "NextTokenKey",
        "TokenExpiredDate",
        "StatusSync",
        "TimeSync",
        "CountSync",
        "CurrentURL",
        "RoleID",
        "GroupID",
        "IsEmpNoMax",
        "DV_RECORD_SOURCE",
        "DV_APPLIED_DATE"

    from source
)
select * from renamed;');

