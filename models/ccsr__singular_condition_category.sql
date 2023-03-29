select 
    encounter_id,
    claim_id,
    patient_id,
    ccsr_category,
    ccsr_category_description,
    {{ var('dxccsr_version') }} as dxccsr_version
 from {{ref('ccsr__long_condition_category')}}
 where 
    is_ip_default_category = true
    and diagnosis_rank = 1