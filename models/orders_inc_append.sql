{{ 
    config(
        materialized = 'incremental',
        incremental_strategy = 'append'
    )
}}

select
    order_id,
    customer_name,
    product,
    amount,
    order_datetime,
    '{{ invocation_id }}' as dbt_invocation_id
from
    {{ source('src', 'orders_inc')}}


{% if is_incremental() %}
    where order_datetime > (select max(order_datetime) from {{ this }})
{% endif %}