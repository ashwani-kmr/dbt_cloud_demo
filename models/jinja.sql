{{ "ashwani" }}
{{ 234567 }}
{{ ['ashwani', 'kumar'] }}
{{ {"name": "ashwani", "role": "Data"} }}

{%- set str2 = 'second_string' -%}
{{str2}}

{%- set mydict = {"name": "ashwani", "role": "Data", "age": 26} -%}
{{mydict}}

{% set cdn = 'elif'%}
{% if cdn=='if' %}
{{"if condition is TRUE"}}
{% elif cdn == 'elif'%}
{{" elif condition is TRUE"}}
{% else %}
{{"else condition is TRUE"}}
{% endif %}

-- loop
{% set mylist = ['a', 'b', 'c'] %}
{%- for i in mylist -%}
{{i}}
{% endfor %}

{{ dbt_utils.get_column_values(source('src', 'dim_orders'), 'product') }}

{% set p = dbt_utils.get_column_values(source('src', 'dim_orders'), 'product') %}
{{p}}

{% set cols = adapter.get_columns_in_relation(source('src', 'sales_data')) %}
{%- for i in cols -%}
    {{i.column}}
{% endfor %}

{%set payment_modes = dbt_utils.get_column_values(source('src', 'sales_data'), 'payment_mode') %}
{{payment_modes}}


{%set payment_modes = dbt_utils.get_column_values(source('src', 'sales_data'), 'payment_mode') %}
select
{% for pm in payment_modes %}
sum(case when payment_mode = '{{pm}}' then sales end) as {{pm}}_total_sales,
{% endfor %}
from {{source('src', 'sales_data')}}

{%set payment_modes = dbt_utils.get_column_values(source('src', 'sales_data'), 'payment_mode') %}
select
{% for pm in payment_modes %}
sum(case when payment_mode = '{{pm}}' then sales end) as {{pm}}_total_sales
{%- if not loop.last%},{% endif %}
{% endfor %}
from {{source('src', 'sales_data')}}