with source as (
    select *
    from {{ source('tpch', 'supplier') }}
),
renamed as (
    select
        s_suppkey      as supplier_key,
        s_name         as supplier_name,
        s_address      as supplier_address,
        s_nationkey    as nation_key,
        s_phone        as supplier_phone,
        s_acctbal      as account_balance,
        s_comment      as supplier_comment,

        case
            when s_acctbal > 0 then 'Positive Balance'
            when s_acctbal < 0 then 'Negative Balance'
            else 'Zero Balance'
        end as account_balance_status

    from source
)

select * from renamed