{{ config(
    materialized="table",
    schema="ethereum_test"
) }}

-- depends_on: {{ ref('ethereum_trx_daily')}}
SELECT date_week, trx_Xd AS trx_weekly FROM
{{ metrics.calculate(
    metric('trx_Xd'),
    grain='week'
) }}