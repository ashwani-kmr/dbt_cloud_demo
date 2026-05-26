with source as (
    select *
    from {{ source('tpch', 'partsupp') }}
),

renamed as (
    select
        ps_partkey      as part_key,
        ps_suppkey      as supplier_key,
        ps_availqty     as available_quantity,
        ps_supplycost   as supply_cost,
        ps_comment      as partsupp_comment,
        round(
            ps_availqty * ps_supplycost,
            2
        ) as total_inventory_cost
    from source

)

select * from renamed