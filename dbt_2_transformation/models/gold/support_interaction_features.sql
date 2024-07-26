-- models/gold/support_interaction_features.sql

WITH fact_support_interactions AS (
    SELECT *
    FROM {{ ref('fact_support_interactions') }}
)

SELECT 
    fact_si.customer_id,
    COUNT(fact_si.interaction_id) AS total_support_interactions,
    AVG(fact_si.resolution_time) AS avg_resolution_time
FROM fact_support_interactions fact_si
GROUP BY fact_si.customer_id