{{ config(
    materialized='table',
    schema='banking_marts'
) }}

SELECT
    a.account_id,
    a.customer_name,
    a.account_type,
    a.status,
    COUNT(DISTINCT c.card_id)               AS total_cards,
    COUNT(DISTINCT t.transaction_id)        AS total_transactions,
    COALESCE(SUM(t.amount), 0)              AS total_spent,
    COALESCE(MAX(t.transaction_date), NULL) AS last_transaction_date
FROM {{ ref('stg_accounts') }} a
LEFT JOIN {{ ref('stg_cards') }} c
       ON a.account_id = c.account_id
LEFT JOIN {{ ref('stg_transactions') }} t
       ON c.card_id = t.card_id
GROUP BY
    a.account_id,
    a.customer_name,
    a.account_type,
    a.status