{% macro gender_desc(g) %}
case
    when {{g}} = 'M' then 'MALE'
    when {{g}} = 'F' then 'FEMALE'
    when {{g}} is NULL then 'NA'
    ELSE 'OTHER'
END
{% endmacro %}