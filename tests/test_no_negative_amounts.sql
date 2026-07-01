-- Тест: няма отрицателни суми в транзакциите
SELECT transaction_id
FROM {{ ref('stg_transactions') }}
WHERE amount < 0
  AND transaction_type != 'TAX'