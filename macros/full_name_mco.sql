{% macro full_name_mco(f_name, m_name, l_name) %}
initcap(
    coalesce({{f_name}}, '') || ' ' ||
    coalesce({{m_name}}, '') || ' ' ||
    coalesce({{l_name}}, '')
)
{% endmacro %}