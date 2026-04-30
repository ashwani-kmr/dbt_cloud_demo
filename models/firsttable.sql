-- select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER LIMIT 2

select * from {{source("All_tables", "CUSTOMER")}} limit 5