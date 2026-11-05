# subscriptions

Grain (a guess from the data, confirm it): one row per subscription_id. 30,747 rows.

## Columns

| Name | Type | Null rate | Distinct |
| --- | --- | --- | --- |
| subscription_id | int64 | 0.00% | 30,747 |
| user_id | int64 | 0.00% | 30,747 |
| plan | object | 0.00% | 3 |
| start_date | datetime64[ns] | 0.00% | 9,584 |
| end_date | datetime64[ns] | 87.90% | 1,789 |
| status | object | 0.00% | 3 |

## Date ranges

- `start_date`: 2022-01-11T00:00:00 to 2026-10-04T17:15:33
- `end_date`: 2022-03-07T00:00:00 to 2026-11-11T18:47:46

## Low-cardinality values

- `plan`: free (18,234), monthly (9,376), annual (3,137)
- `status`: active (27,028), expired (2,929), canceled (790)

## Meaning

Grain (inferred): one subscription per user; user_id is unique too, so there is no history of plan changes or resubscribes.

- `subscription_id`: key (inferred).
- `user_id`: the subscriber; joins to users.user_id, every row matches (inferred).
- `plan`: free, monthly or annual (inferred). Free rows never end (quirk: Free plans never end).
- `start_date`: when the plan began (inferred). 2026-10-04 max is after the data end of 2026-09-24: scheduled starts (quirk: Future start dates).
- `end_date`: when the subscription ended or will end (inferred). Null for all active rows and all free rows. Dates after 2026-09-24 sit on `canceled` rows, i.e. scheduled cancellations, not on `active` rows (see quirks proposal below). Annual null rate 94%, monthly 62%.
- `status`: active, canceled or expired (inferred). Whether canceled and expired both count as churn is not confirmed.

Observed for monthly: end dates per month run around 115-145 until March 2026, then jump to 300-350 from April 2026.

Verdict: Caution. Future end dates sit on canceled rows, which the quirk text does not say; a start spike in Sep 2025 and Sep 2026 is partly explained (Sep 2025 by quirk).

