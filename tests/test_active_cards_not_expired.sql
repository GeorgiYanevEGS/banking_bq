{{ config(severity='warn') }}

SELECT card_id
FROM {{ ref('stg_cards') }}
WHERE expiry_date < CURRENT_DATE()