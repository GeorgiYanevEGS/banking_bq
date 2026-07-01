-- Тест: SAVINGS акаунти имат положителен баланс
SELECT account_id
FROM {{ ref('stg_accounts') }}
WHERE account_type = 'SAVINGS'
  AND status != 'ACTIVE'