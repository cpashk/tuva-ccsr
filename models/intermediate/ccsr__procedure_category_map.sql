select 
    icd_10_pcs as code,
    icd_10_pcs_description as code_description,
    prccsr as ccsr_category,
    prccsr_description as ccsr_description,
    clinical_domain
from {{ ref('prccsr_v2023_1_cleaned_map')}}