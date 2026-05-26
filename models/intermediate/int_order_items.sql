with orders as (
    select * from {{ ref('stg_orders') }}
),
lineitems as (
    select * from {{ref('stg_lineitems') }}
),
order_items as (
    select
    o.order_key,
    o.customer_key,
    o.order_status,
    o.order_priority,
    o.order_year,
    o.order_month,
    l.part_key,
    l.line_number,
    l.quantity,
    l.extended_price,
    l.discount_percentage,
    l.net_revenue,
    l.ship_date,
    l.ship_mode,
    l.return_flag,
    l.days_late
    from orders o
    inner join lineitems l
    on o.order_key = l.order_key
)
select * from order_items