{{
    config(
        materialized='incremental'
    )
}}

with
    customers as (
        select *
        from {{ref("dim_customers")}}
    ),

    orders as (
        select
        *
        from {{ref("stg_orders")}}
 --       {% if is_incremental() %}
    
  --  where OrderDate >= (select max(OrderDate) from {{ this }} )

 --       {% endif %}
    )

    select
        customers.sk_customer,
        orders.*
    from orders
    left join customers on orders.CustomerId = customers.CustomerId