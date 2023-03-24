{{ config(materialized='table') }}


with procedure as (
    
    select * from {{ var('procedure') }}

), ccsr__procedure_category_map as (

    select * from {{ ref ('ccsr__procedure_category_map') }}

)

select distinct
    procedure.encounter_id,
    procedure.patient_id,
    procedure.code,
    ccsr__procedure_category_map.icd_10_pcs_description,
    ccsr__procedure_category_map.ccsr_category,
    ccsr__procedure_category_map.ccsr_description,
    ccsr__procedure_category_map.clinical_domain,
    {{ var('prccsr_version') }} as prccsr_version
from procedure
left join ccsr__procedure_category_map using(code)