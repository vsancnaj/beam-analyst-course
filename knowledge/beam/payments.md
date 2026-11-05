# payments

Grain (a guess from the data, confirm it): one row per payment_id. 100,914 rows.

## Columns

| Name | Type | Null rate | Distinct |
| --- | --- | --- | --- |
| payment_id | int64 | 0.00% | 100,914 |
| subscription_id | int64 | 0.00% | 11,122 |
| payment_date | datetime64[ns] | 0.00% | 13,232 |
| amount_usd | float64 | 0.00% | 3 |
| method | object | 0.00% | 4 |

## Date ranges

- `payment_date`: 2025-01-01T00:00:00 to 2026-09-24T23:51:30

## Low-cardinality values

- `amount_usd`: 10.0 (59,064), 12.0 (37,384), 100.0 (4,466)
- `method`: card (50,237), paypal (20,272), apple_pay (15,298), google_pay (15,107)

## Meaning

Grain (inferred): one payment per row, many per subscription.

- `payment_id`: key (inferred).
- `subscription_id`: joins to subscriptions; 11,122 distinct, monthly and annual only, no free (inferred).
- `payment_date`: charge date; range starts 2025-01-01, so payments before 2025 are absent (inferred). Latest 2026-09-24.
- `amount_usd`: 10 (monthly before March 2026), 12 (monthly from March 2026), 100 (annual) (quirk: Monthly price change).
- `method`: card, paypal, apple_pay, google_pay (inferred).

Caveat: payments start 2025-01, so about 12% of monthly subscriptions (mostly pre-2025 starters or very recent) have no payment rows. Do not use payments alone as a subscriber count.

Verdict: Proceed, with the 2025-01 start in mind.

