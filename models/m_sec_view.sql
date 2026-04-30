{{config(
    materialized='view',
    secure=true)}}

select * from {{source("All_tables", "CUSTOMER")}} limit 10