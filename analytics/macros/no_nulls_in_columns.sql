-- model : Any model file defined in the model folder 
-- adapter.get_columns_in_relation(model): Built in dbt function used to fetch columns from a model
-- The '(model)-%' : The hyphen is used to remove white spaces
{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}