{{config(
    materialized='table',
    transient=false)}}

select * from {{source("All_tables", "CUSTOMER")}} limit 10