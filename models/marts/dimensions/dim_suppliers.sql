with suppliers as (
    select *
    from {{ ref('stg_suppliers') }}
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
        s.supplier_key,
        s.supplier_name,
        s.supplier_address,
        s.supplier_phone,
        s.account_balance,
        s.account_balance_status,

        case
            when s.account_balance >= 5000 then 'preferred_supplier'
            when s.account_balance >= 0 then 'standard_supplier'
            else 'risk_supplier'
        end as supplier_category,

        n.nation_name,
        r.region_name
    from suppliers s
    left join nations n
        on s.nation_key = n.nation_key
    left join regions r
        on n.region_key = r.region_key
)

select * from final