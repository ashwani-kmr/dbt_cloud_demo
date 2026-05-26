with customers as (
    select *
    from {{ ref('stg_customers') }}
),
nations as (
    select *
    from {{ ref('stg_nations') }}
),
regions as (
    select *
    from {{ ref('stg_regions') }}
),
final as (
    select
        c.customer_key,
        c.customer_name,
        c.customer_address,
        c.customer_phone,
        c.account_balance,

        case
            when c.account_balance >= 5000 then 'high_value'
            when c.account_balance >=0 and c.account_balance < 5000 then 'mid_value'
            else 'low_value'
        end as customer_tier,

        c.market_segment,
        n.nation_name,
        r.region_name
    from customers c
    left join nations n
        on c.nation_key = n.nation_key
    left join regions r
        on n.region_key = r.region_key
)
select * from final