{% macro calc_growth_perc(c_revenue, p_revenue) %}
case 
    when {{p_revenue}} is not null and {{p_revenue}} != 0 then
        ({{c_revenue}} - {{p_revenue}}) / {{p_revenue}} * 100
    else null
end
{% endmacro %}