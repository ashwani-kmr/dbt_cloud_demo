{% macro generate_surrogate_key(col_list) %}
md5(
    concat(
        {% for col in col_list %}
            coalesce(cast({{col}} as varchar), '')
            {% if not loop.last %}, '|', {% endif %}
        {% endfor %}
    )
)
{% endmacro %}