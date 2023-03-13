{{ config(materialized='ephemeral') }}
    select 
        trim(icd_10_cm_code, '''') as code,
        default_ccsr_category_ip,
        default_ccsr_category_description_ip,
        default_ccsr_category_op,
        default_ccsr_category_description_op,
        ccsr_category_1,
        ccsr_category_1_description,
        ccsr_category_2,
        ccsr_category_2_description,
        ccsr_category_3,
        ccsr_category_3_description,
        ccsr_category_4,
        ccsr_category_4_description,
        ccsr_category_5,
        ccsr_category_5_description,
        ccsr_category_6,
        ccsr_category_6_description
    from dev_chase.ccsr_csv.dxccsr   