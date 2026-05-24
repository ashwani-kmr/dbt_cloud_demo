{% macro calc_final_price(p, d) %}
({{p}} * (1 - {{d}}))
{% endmacro %}