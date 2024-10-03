with
    categories as (
        select
        *
        from {{source('northwind','Categories')}}
    )

    select
    *
    from categories