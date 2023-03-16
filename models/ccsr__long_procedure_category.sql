{{ config(materialized='table',enabled=true) }}



select 
    aa.encounter_id,
    aa.code,
    bb.ccsr_category
from {{ var('procedure') }} as aa
left join {{ ref ('ccsr__procedure_category_map') }} as bb using(code)