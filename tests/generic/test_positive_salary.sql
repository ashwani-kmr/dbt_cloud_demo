{% test value_greater_than(model, column_name, min_value) %}

select * from {{ model }}
where {{ column_name }} < {{ min_value }}

{% endtest %}