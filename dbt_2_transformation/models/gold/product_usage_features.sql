-- models/gold/product_usage_features.sql

WITH fact_product_usage AS (
    SELECT *
    FROM {{ ref('fact_product_usage') }}
)

SELECT 
    fc_pu.customer_id,
    COUNT(fc_pu.usage_id) AS total_logins,
    COUNT(DISTINCT fc_pu.date_id) AS total_days,
    COUNT(fc_pu.usage_id) * 1.0 / COUNT(DISTINCT fc_pu.date_id) AS avg_logins_per_day,
    SUM(fc_pu.amount) AS total_spent,
    MAX(fc_pu.date_id) - MIN(fc_pu.date_id) AS usage_days_span
FROM fact_product_usage fc_pu
GROUP BY fc_pu.customer_id