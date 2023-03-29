with ccsr__dx_vertical_pivot as (
    
    select * from {{ ref('ccsr__dx_vertical_pivot') }}

), condition as (
    
    select * from {{ var('condition')}}

)

select 
    condition.encounter_id,
    condition.claim_id,
    condition.patient_id,
    condition.code,
    ccsr__dx_vertical_pivot.code_description,
    condition.diagnosis_rank,
    ccsr__dx_vertical_pivot.ccsr_category,
    ccsr__dx_vertical_pivot.ccsr_category_description,
    ccsr__dx_vertical_pivot.ccsr_category_rank,
    ccsr__dx_vertical_pivot.is_ip_default_category,
    ccsr__dx_vertical_pivot.is_op_default_category,
    {{ var('dxccsr_version') }} as dxccsr_version
from condition 
left join ccsr__dx_vertical_pivot using(code)

    