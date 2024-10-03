{{
    config(
        materialized='incremental', unique_key = 'OrderID'
    )
}}
with
    orders as (
        select *
        from {{source('northwind','Orders')}}
        --where OrderDate < '1998-01-01'
        {% if is_incremental() %}
    
where OrderDate > (select max(OrderDate) from {{ this }} )

        {% endif %}
    )

select *
from orders