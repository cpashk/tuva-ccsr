{{ config(materialized='table',enabled=false) }}





{% set categories_list = dbt_utils.get_column_values(
        table=ref("ccsr__procedure_category_map"),
        column="code"
) %}

select * from {{ var('procedure') }}