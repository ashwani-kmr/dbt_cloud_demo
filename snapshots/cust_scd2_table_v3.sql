{% snapshot cust_scd2_table_v3 %}
{{
    config(
        unique_key = 'customer_id',
        strategy = 'check',
        check_cols = ['name', 'city_tier']
    )
}}

select * from {{ source('src', 'customer_v3')}}

{% endsnapshot %}