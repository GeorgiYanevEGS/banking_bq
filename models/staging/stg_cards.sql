{{ config(
    materialized='view',
    schema='banking_staging'
) }}

SELECT
    card_id,
    account_id,
    card_no,
    UPPER(card_type)                                AS card_type,
    expiry_date,
    UPPER(status)                                   AS status,
    CASE WHEN expiry_date >= CURRENT_DATE()
         THEN TRUE ELSE FALSE END                   AS is_valid
FROM {{ source('banking_raw', 'cards') }}