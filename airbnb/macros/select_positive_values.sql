{% macro select_positive_values(model, column_name) %}
    SELECT *
    FROM {{ model }}
    WHERE {{ column_name }} > 0
{% endmacro %}

-- To run this macro, in commandline execute 
/*to compile :
dbt compile --inline "{{ select_positive_values('dim_listings_cleansed', 'price') }}"
to show sample of results :
dbt show --inline "{{ select_positive_values('dim_listings_cleansed', 'price') }}"*/