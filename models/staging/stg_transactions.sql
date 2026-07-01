{{ config(
    materialized='view',
    schema='banking_staging'
) }}

SELECT
    transaction_id,
    card_id,
    amount,
    currency,
    UPPER(txn_type)                                         AS transaction_type,
    UPPER(TRIM(merchant))                                   AS merchant,
    UPPER(status)                                           AS status,
    DATE(DATETIME(txn_date, 'Europe/Sofia'))                AS transaction_date,
    EXTRACT(MONTH FROM DATETIME(txn_date, 'Europe/Sofia'))  AS transaction_month,
    EXTRACT(YEAR  FROM DATETIME(txn_date, 'Europe/Sofia'))  AS transaction_year
FROM {{ source('banking_raw', 'transactions') }}