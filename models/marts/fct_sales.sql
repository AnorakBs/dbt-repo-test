with
    dim_products as (
        select
        *
        from {{ref("dim_products")}}
    ),
    -- dim_categories as (
    --     select
    --     *
    --     from {{ref("dim_categories")}}
    -- ),
    dim_suppliers as (
        select
        *
        from {{ref("dim_suppliers")}}
    )

    select
        order_details.OrderID,
        order_details.ProductID,
        dim_products.CategoryID,
        dim_products.SupplierID,
        order_details.Quantity,
        order_details.UnitPrice,
        order_details.Discount,
        (order_details.Quantity * order_details.UnitPrice) AS TotalPrice,
        (order_details.Quantity * order_details.UnitPrice * order_details.Discount) AS DiscountAmount,
        (order_details.Quantity * order_details.UnitPrice) - (order_details.Quantity * order_details.UnitPrice * order_details.Discount) AS FinalPrice
    from {{ref('stg_order_details')}} as order_details
    left join dim_products 
        on order_details.ProductID = dim_products.ProductID
    -- join dim_categories
    --     on order_details.CategoryID = dim_categories.CategoryID
    -- join dim_suppliers
    --     on order_details.SupplierID = dim_suppliers.SupplierID