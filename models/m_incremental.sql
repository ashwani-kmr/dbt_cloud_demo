{{config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
    )}}

select order_id,
customer_name,
amount,
order_datetime,
'{{ invocation_id }}' as dbt_invocation_id
from {{source("src", "dim_orders")}}

{% if is_incremental() %}
where order_datetime > (select max(order_datetime) from {{this}})
{% endif %}