{{config(materialized='view')}}

select * from {{source("All_tables", "CUSTOMER")}} limit 10