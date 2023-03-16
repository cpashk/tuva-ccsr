{{ config(materialized='ephemeral') }}

select 
    icd_10_pcs as code,
    prccsr as ccsr_category
from {{ ref('prccsr_v2023_1_cleaned_map')}}