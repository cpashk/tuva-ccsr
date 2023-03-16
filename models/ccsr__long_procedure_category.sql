{{ config(materialized='table',enabled=true) }}


select distinct
    aa.encounter_id,
    aa.code,
    bb.ccsr_category,
    {{ var('prccsr_version') }} as prccsr_version
from {{ var('procedure') }} as aa
left join {{ ref ('ccsr__procedure_category_map') }} as bb using(code)