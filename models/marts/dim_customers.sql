with 
    dim_customers as (
        select 
            {{ dbt_utils.generate_surrogate_key(['CustomerId', 'CompanyName']) }} as sk_customer,
            *
        from {{ref("stg_customers")}}
    )

select 
* 
from dim_customers