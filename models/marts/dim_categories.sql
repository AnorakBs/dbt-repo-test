with 
    dim_categories as (
        select 
            {{ dbt_utils.generate_surrogate_key(['CategoryID', 'CategoryName']) }} as sk_categories,
            *
        from {{ref("stg_categories")}}
    )

select 
* 
from dim_categories