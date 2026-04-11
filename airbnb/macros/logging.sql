{% macro learn_logging() %}
    {{ log("Call your mom!") }}
    {{ log("Call your dad!", info=True) }} {# Logs to the screen, too #}
--  {{ log("Call your dad!", info=True) }} {# This will be logged to the screen #}
    {# log("Call your dad!", info=True) #} {# This won't be executed #}
{% endmacro %}

{# the info=True is to see the execution trace in the log screen
to run this macro directly execute : dbt run-operation learn_logging #}