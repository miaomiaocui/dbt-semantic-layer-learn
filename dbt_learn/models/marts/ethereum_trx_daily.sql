{{ config(
    materialized="table",
    schema="ethereum_test"
) }}


SELECT
  DATE(DATE_TRUNC(block_timestamp, DAY)) AS day
  , COUNT(DISTINCT `hash`) AS trx_cnt
FROM {{ref('stg_ethereum_trx')}}
GROUP BY 1