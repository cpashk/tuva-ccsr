with codes as (
    
    select
        icd_10_cm_code as code, 
        -- loop to generate columns for CCSR categories 1-6
        {%- for i in range(1,7) %}
        ccsr_category_{{ i }},
        {%- endfor %}
        default_ccsr_category_ip,
        default_ccsr_category_op
    from {{ ref('dxccsr_v2023_1_cleaned_map') }}

), long_union as (
    -- generate select & union statements to pivot category columns to rows
    {% for i in range(1,7,1) %}
    select 
        code,
        ccsr_category_{{ i }} as ccsr_category,
        {{ i }} as ccsr_category_rank,
        (ccsr_category_{{ i }} = default_ccsr_category_ip) as is_ip_default_category,
        (ccsr_category_{{ i }} = default_ccsr_category_op) as is_op_default_category
    from codes 
    {{ "union" if not loop.last else "" }}
    {%- endfor %}

)

select distinct
    *
from long_union
-- as not all diagnosis codes have multiple categories, we can discard nulls
where ccsr_category is not null