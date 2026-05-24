{% macro calc_revenue_ratio(c_revenue, p_revenue) %}
case
    when {{p_revenue}} = 0 then null
    else {{c_revenue}} / {{p_revenue}}
end
{% endmacro %}