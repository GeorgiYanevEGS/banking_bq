{{ config(
    materialized='view',
    schema='banking_staging'
) }}

SELECT
    transaction_id,
    account_id,
    card_id,
    amount,
    UPPER(transaction_type)                         AS transaction_type,
    UPPER(TRIM(merchant))                           AS merchant,
    DATE(DATETIME(transaction_at, 'Europe/Sofia'))  AS transaction_date,
    EXTRACT(MONTH FROM DATETIME(transaction_at, 'Europe/Sofia')) AS transaction_month,
    EXTRACT(YEAR  FROM DATETIME(transaction_at, 'Europe/Sofia')) AS transaction_year
FROM {{ source('banking_raw', 'transactions') }}