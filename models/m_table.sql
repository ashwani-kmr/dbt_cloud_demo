{{config(materialized='table')}}

select * from {{source("All_tables", "CUSTOMER")}} limit 10