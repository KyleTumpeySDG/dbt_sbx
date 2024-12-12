with orders as (

     select * from {{ ref('stg_jaffle_shop__orders') }}

),

payments as ( 

    select * from {{ ref('stg_stripe__payments') }}

),

customer_payments as (

    select
        order_id,
        sum(amount) as total_amount

    from payments
    where status = 'success'
    group by 1

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        customer_payments.total_amount

    from orders

    left join customer_payments using (order_id)

)

select * from final