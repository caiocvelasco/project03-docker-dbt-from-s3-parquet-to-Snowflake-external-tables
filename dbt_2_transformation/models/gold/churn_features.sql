-- models/gold/churn_features.sql

WITH churn_customers AS (
    SELECT *
    FROM {{ ref('churn_customers') }}
),
product_usage_features AS (
    SELECT *
    FROM {{ ref('product_usage_features') }}
),
support_interaction_features AS (
    SELECT *
    FROM {{ ref('support_interaction_features') }}
)

SELECT 
    cc.customer_id,
    cc.name,
    cc.age,
    cc.gender,
    cc.signup_date,
    cc.subscription_type,
    cc.start_date,
    cc.end_date,
    cc.is_churned,
    puf.total_logins,
    puf.avg_logins_per_day,
    puf.total_spent,
    puf.usage_days_span,
    sif.total_support_interactions,
    sif.avg_resolution_time
FROM churn_customers cc
LEFT JOIN product_usage_features puf ON cc.customer_id = puf.customer_id
LEFT JOIN support_interaction_features sif ON cc.customer_id = sif.customer_id
