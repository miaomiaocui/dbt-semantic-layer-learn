{{ config(
    materialized="view",
    schema="ethereum_test"
) }}


SELECT
  block_timestamp
  , `hash`
  , from_address
  , to_address
FROM
  `bigquery-public-data.crypto_ethereum.transactions`
WHERE DATE(block_timestamp) >= '2023-01-01'
