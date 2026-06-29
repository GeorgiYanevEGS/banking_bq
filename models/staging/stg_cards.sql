{{ config(
    materialized='view',
    schema='banking_staging'
) }}

SELECT
    card_id,
    account_id,
    UPPER(card_type)                        AS card_type,
    card_number,
    expiry_date,
    is_active,
    CASE WHEN expiry_date >= CURRENT_DATE()
         THEN TRUE ELSE FALSE END           AS is_valid
FROM {{ source('banking_raw', 'cards') }}