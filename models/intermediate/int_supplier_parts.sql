with partssupps as (
    select * from {{ ref('stg_partsupp') }}
),
suppliers as (
    select * from {{ref('stg_suppliers') }}
),
nations as (
    select * from {{ref('stg_nations') }}
),
regions as (
    select * from {{ref('stg_regions') }}
),
enriched as (
    select
    ps.part_key,
    ps.supplier_key,
    ps.available_quantity,
    ps.supply_cost,
    ps.total_inventory_cost,
    s.supplier_name,
    s.account_balance,
    s.account_balance_status,
    n.nation_name,
    r.region_name
    from partssupps ps
    left join suppliers s on ps.supplier_key = s.supplier_key
    left join nations n on s.nation_key = n.nation_key
    left join regions r on n.region_key = r.region_key
)
select * from enriched