with
    products as (
        select
        *
        from {{source('northwind','Products')}}
    )

    select
    *
    from products