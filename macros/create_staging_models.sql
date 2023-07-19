{#  
    -- let's develop a macro that 
    1. queries the information schema of a database
    2. build query to create the table
    3. generates automated create statements
    4. has the ability to execute those create statements

#}
{% macro create_staging_models() %}
    
    {% set get_create_commands_query %}
        select
           SQLcode
        from {{ ref('dv__columns') }} 
    {% endset %}

    {{ log('\nGenerating create table queries...\n', info=True) }}
    {% set create_queries = run_query(get_create_commands_query).columns[0].values() %}

    {% for query in create_queries %}
        {{ log('create object with command: ' ~ query, info=True) }}
            {% do run_query(query) %}      
    {% endfor %}
    
{% endmacro %} 