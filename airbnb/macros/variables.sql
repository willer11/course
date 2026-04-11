{% macro learn_variables() %}

    {% set your_name_jinja = "Mehdi" %}   {# Here we are defining a Jinja variable #}
    {{ log("Hello " ~ your_name_jinja, info=True) }}. {# info=True is to see the trace in the screen log , the tild is for concatenation #}

    {{ log("Hello dbt user " ~ var("user_name", "NO USERNAME IS SET!!") ~ "!", info=True) }}.  {# var("user_name", "NO USERNAME IS SET!!")  this is a dbt variable var(name, default_value_in_case _it_is_missing) #}
    {# user_name value is by default retrieved from dbt_project.yml file of the project, if missing then value vy default, or it can also be overwritten in the commandline using 
    dbt run-operation learn_variables --vars "{user_name: Hohoooooo}" #}

    {% if var("in_test", False) %}
       {{ log("In test", info=True) }}
    {% else %}
       {{ log("NOT in test", info=True) }}
    {% endif %}

{% endmacro %}