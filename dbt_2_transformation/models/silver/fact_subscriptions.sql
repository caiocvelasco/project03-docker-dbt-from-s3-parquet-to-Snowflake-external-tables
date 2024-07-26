-- models/silver/fact_subscriptions.sql
-- Transformations:
    -- Ensuring data types are correct
select
    subscription_id,
    customer_id,
    start_date,
    end_date,
    type,
    status,
    -- extracted_at,
    current_timestamp as inserted_at  -- Overwrite with current timestamp
from {{ source('bronze','subscriptions') }}  -- References the bronze.subscriptions table