{{ config(
    materialized='table',
    schema='banking_marts'
) }}

SELECT
    transaction_year,
    transaction_month,
    transaction_type,
    COUNT(*)        AS transaction_count,
    SUM(amount)     AS total_amount,
    AVG(amount)     AS avg_amount,
    MAX(amount)     AS max_amount
FROM {{ ref('stg_transactions') }}
GROUP BY
    transaction_year,
    transaction_month,
    transaction_type
ORDER BY
    transaction_year,
    transaction_month