{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='order_key'
    )
}}

with order_items as (
    select *
    from {{ ref('int_order_items') }}
),
final as (
    select
        order_key,
        customer_key,
        order_status,
        order_priority,
        order_year,
        order_month,

        count(line_number) as total_line_items,
        sum(quantity) as total_quantity,
        round(sum(extended_price), 2) as gross_order_amount,
        round(sum(net_revenue), 2) as net_order_revenue,
        max(days_late) as max_days_late

    from order_items

    {% if is_incremental() %}
        where ship_date > (select max(ship_date) from {{ this }})
    {% endif %}

    group by
        order_key,
        customer_key,
        order_status,
        order_priority,
        order_year,
        order_month
)
select * from final