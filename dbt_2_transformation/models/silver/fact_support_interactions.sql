-- models/silver/fact_support_interactions.sql
-- Transformations:
    -- Ensuring data types are correct
select
    interaction_id,
    customer_id,
    date_id,
    issue_type,
    resolution_time,
    -- extracted_at,
    current_timestamp as inserted_at  -- Overwrite with current timestamp
from {{ source('bronze','support_interactions') }}  -- References the bronze.support_interactions external table