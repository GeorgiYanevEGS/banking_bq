-- Тест: активните карти не са изтекли
SELECT card_id
FROM {{ ref('stg_cards') }}
WHERE is_active = TRUE
  AND expiry_date < CURRENT_DATE()