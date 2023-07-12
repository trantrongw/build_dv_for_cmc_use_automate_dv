{{ dbt_utils.union_relations(
    relations=[
            ref('mart__customer')
            , ref('mart__department')
            , ref("mart__employee")
            , ref("Invoice")
            , ref("mart__opportunity")
            , ref("Profit")
            , ref("mart__sale")
            , ref("mart__solution")
            , ref("mart__plan")
            ],
    include=["_KEY_CUSTOMER"
        ,"_KEY_DEPARTMENT"
        ,"_KEY_EMPLOYEE"
        ,"_KEY_INVOICE"
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
    source_column_name="Stage"
) }}