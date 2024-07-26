-- models/silver/dim_dates.sql
-- Transformations:
    -- Ensuring a date format to date
select
    date_id,
    date,
    week,
    month,
    quarter,
    year,
    -- extracted_at,
    current_timestamp as inserted_at  -- Overwrite with current timestamp
from {{ source('bronze','dates') }}  -- References the bronze.dates external table