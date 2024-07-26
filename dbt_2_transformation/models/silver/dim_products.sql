-- models/silver/dim_products.sql
-- Transformations:
    -- Ensuring data types are correct
select
    product_id,
    product_name,
    category,
    cast(price as decimal(10, 2)) as price,  -- Ensure price format
    -- extracted_at,
    current_timestamp as inserted_at  -- Overwrite with current timestamp
from {{ source('bronze','products') }}  -- References the bronze.products external table