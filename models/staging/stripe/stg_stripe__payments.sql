select
    id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount / 100 as amount,
    created as created_at

from dbt_dev.dbt_ktumpey.stripe_payment