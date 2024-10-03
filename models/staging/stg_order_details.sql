with
    orders_details as (
        select *
        from {{source('northwind','OrderDetails')}}
    )

select *
from orders_details