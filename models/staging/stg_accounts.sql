{{ config(
    materialized='view',
    schema='banking_staging'
) }}

SELECT
    account_id,
    UPPER(TRIM(customer_name))              AS customer_name,
    UPPER(account_type)                     AS account_type,
    balance,
    DATE(DATETIME(created_at, 'Europe/Sofia'))  AS created_date
FROM {{ source('banking_raw', 'accounts') }}