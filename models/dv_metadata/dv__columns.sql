WITH ColumnLists
AS
(
SELECT 
	TableName=TABLE_NAME,
	ColumnName=COLUMN_NAME,
    DataType=DATA_TYPE,
    MaximumLength=IIF(CHARACTER_MAXIMUM_LENGTH = -1,4000, CHARACTER_MAXIMUM_LENGTH)*2,
    DecimalPrecision=NUMERIC_PRECISION,DATETIME_PRECISION,
    DecimalScale=COALESCE(NUMERIC_SCALE,DATETIME_PRECISION),
    ColumnSort=ORDINAL_POSITION
FROM [dbo].[Staging__CMIS_INFORMATION_SCHEMA_COLUMNS] A

),
table1 as
(
SELECT 
NewTableName = CONCAT('source__CMIS_dbo_',TableName),
QUOTENAME(ColumnName) + ' ' 
+ CASE  WHEN DataType IN (  'nvarchar' ) THEN
	    'varchar'
        WHEN DataType IN ( 'datetime' ) THEN
        'datetime2'
        WHEN DataType IN ( 'tinyint' ) THEN
        'int'
       
	ELSE
		LOWER(DataType)
	END
+ CASE
        WHEN DataType IN ( 'varchar', 'nvarchar' ) THEN
            '(' + CAST(MaximumLength AS VARCHAR(10)) + ')'
        WHEN DataType IN ( 'decimal', 'numeric' ) THEN
            '(' + CAST(DecimalPrecision AS VARCHAR(10)) + ','
            + CAST(DecimalScale AS VARCHAR(10)) + ')'
        WHEN DataType IN ( 'datetime','datetime2' ) THEN
            '(6)'
       
        ELSE
            ''
    END  as ColWithType
FROM ColumnLists
union all
select NewTableName ='default', ColWithType = 'dv_record_source varchar(50)'
union all
select NewTableName ='default', ColWithType = 'dv_applied_date varchar(50)'
)
SELECT 
	'IF OBJECT_ID(N''dbo.'+max(NewTableName)+''', N''U'') IS NULL '+'create table '+max(NewTableName) +'(' +STRING_AGG(ColWithType, ', ')+')' AS SQLcode
FROM table1 A
	right join [Staging__CMIS_INFORMATION_SCHEMA_TABLES] B ON A.NewTableName =  CONCAT('source__CMIS_dbo_',B.TABLE_NAME) or A.NewTableName = 'default'
group by CONCAT('source__CMIS_dbo_',B.TABLE_NAME)
