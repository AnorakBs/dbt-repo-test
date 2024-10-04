with
    products as (
        select
        *
        from {{source('northwind','Products')}}
        {% if env_var("DBT_TARGET_SCEHMA") == 'dev' %}
        limit 100

        {% endif %}
    )

    select
    *
    from products