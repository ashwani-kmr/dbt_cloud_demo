{% macro pivot_category_flag(column_name, values_list) %}
{% for val in values_list %}
    case 
        when {{column_name}} = '{{val}}' then 1
        else 0
    end as {{val}}
    {% if not loop.last %}, {% endif %}
{% endfor %}
{% endmacro %}