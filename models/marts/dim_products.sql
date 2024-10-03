with 
    dim_products as (
        select 
            {{ dbt_utils.generate_surrogate_key(['ProductID', 'ProductName']) }} as sk_products,
            *
        from {{ref("stg_products")}}
    )

select 
* 
from dim_products