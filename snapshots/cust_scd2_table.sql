{% snapshot cust_scd2_table %}
{{
    config(
        unique_key = 'customer_id',
        strategy = 'timestamp',
        updated_at = 'updated_at'
    )
}}

select * from {{ source('src', 'customer_v1')}}

{% endsnapshot %}