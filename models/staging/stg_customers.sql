with
    customers as (
        select 
            CustomerId,
            CompanyName,
            ContactName,
            Address,
            City,
            Country
        from {{source('northwind','Customers')}}
    )

select *
from customers