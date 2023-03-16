{{ config(materialized='table',enabled=true) }}

{% set categories_list = dbt_utils.get_column_values(
        table=ref("ccsr__procedure_category_map"),
        column="ccsr_category"
) %}

with dedupe_records as (

    select distinct
        encounter_id,
        ccsr_category
    from {{ ref('ccsr__long_procedure_category') }} 

)

select
    encounter_id,
    {% for category in categories_list %}
    sum(case when ccsr_category = '{{ category }}' then 1 else 0 end) as prccsr_{{ category|lower }},
    {% endfor %}
    {{ var('prccsr_version') }} as prccsr_version
from dedupe_records
group by encounter_id, prccsr_version