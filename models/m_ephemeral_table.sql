{{config(
    materialized='ephemeral')}}

select * from {{source("All_tables", "CUSTOMER")}} limit 10