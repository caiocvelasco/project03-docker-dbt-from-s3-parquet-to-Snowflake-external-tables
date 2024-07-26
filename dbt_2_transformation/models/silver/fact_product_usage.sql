-- models/silver/fact_product_usage.sql
-- Transformations:
    -- Ensuring data types are correct
select
    usage_id,
    customer_id,
    date_id,
    product_id,
    num_logins,
    cast(amount as decimal(10, 2)) as amount,  -- Ensure amount format
    -- extracted_at,
    current_timestamp as inserted_at  -- Overwrite with current timestamp
from {{ source('bronze','product_usage') }}  -- References the bronze.product_usage external table