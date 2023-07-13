{{ dbt_utils.union_relations(
    relations=[
            ref('mart__customer')
            , ref('mart__department')
            , ref("mart__employee")
            , ref("mart__opportunity")
            , ref("mart__profit") 
            , ref("mart__sale")
            , ref("mart__solution")
            , ref("mart__plan")
            ],
    include=["_KEY_CUSTOMER"
        ,"_KEY_DEPARTMENT"
        ,"_KEY_EMPLOYEE"
        ,"_KEY_OPP"
        ,"_KEY_PROFIT"
        ,"_KEY_SALE"
        ,"_KEY_SOLUTION"
        ,"_KEY_OPP_STATUS"
        ,"_KEY_INVOICE_DATE"
        ,"_KEY_SALE_DATE"
        ,"_KEY_PLAN"
        ,"_KEY_OPP_DATE"
        ],
    column_override = 
        {"_KEY_CUSTOMER": "char(32)",
        "_KEY_DEPARTMENT": "char(32)",
        "_KEY_EMPLOYEE": "char(32)",
        "_KEY_OPP": "char(32)",
        "_KEY_PROFIT": "char(32)",
        "_KEY_SALE": "char(32)",
        "_KEY_SOLUTION": "char(32)",
        "_KEY_PLAN": "char(32)"}
        ,
    source_column_name="Stage"
) }}