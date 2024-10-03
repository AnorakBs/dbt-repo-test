with
    suppliers as (
        select
        *
        from {{source('northwind','Suppliers')}}
    )

    select
    *
    from suppliers