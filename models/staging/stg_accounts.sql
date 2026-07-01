{{ config(
    materialized='view',
    schema='banking_staging'
) }}

SELECT
    account_id,
    account_no,
    UPPER(TRIM(customer_name))    AS customer_name,
    UPPER(account_type)           AS account_type,
    UPPER(status)                 AS status,
    opened_date                   AS created_date
FROM {{ source('banking_raw', 'accounts') }}