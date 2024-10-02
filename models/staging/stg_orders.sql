with
    orders as (
        select *
        from {{source('northwind','Orders')}}
    )

select *
from orders