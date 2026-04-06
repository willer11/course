{# Here is my solution after removing most of the white spaces #}

{% macro no_empty_strings(model) %}
    {%- for col in adapter.get_columns_in_relation(model) %}
        {%- if col.is_string() %}
            {{ col.name }} IS NOT NULL AND {{ col.name }} <> '' AND
        {%- endif -%}
    {%- endfor %}
    TRUE
{% endmacro %}

/*to compile and execute in commandline :
dbt compile --inline "SELECT * FROM {{ ref('dim_listings_cleansed') }} WHERE {{ no_empty_strings(ref('dim_listings_cleansed')) }}"
dbt show --inline "SELECT * FROM {{ ref('dim_listings_cleansed') }} WHERE {{ no_empty_strings(ref('dim_listings_cleansed')) }}"
*/

/*contrairement à select_postive_values où on a un simple select, donc on passe juste le nom du modele 'dim_listings_cleansed', ici on a une built-in function JINJA 
adapter.get_columns_in_relation(model) qui à besoin de la référence du modéle "ref('dim_listings_cleansed'))" et pas juste du mon du modele*/