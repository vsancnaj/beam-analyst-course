# user_activity_metrics

Grain (a guess from the data, confirm it): no id column found. 998 rows.

## Columns

| Name | Type | Null rate | Distinct |
| --- | --- | --- | --- |
| date | datetime64[ns] | 0.00% | 998 |
| dau | int64 | 0.00% | 842 |
| wau | int64 | 0.00% | 950 |
| mau | int64 | 0.00% | 985 |

## Date ranges

- `date`: 2024-01-01T00:00:00 to 2026-09-24T00:00:00

## Low-cardinality values

- None

## Meaning

Grain (inferred): one row per calendar day, no id column; 998 rows from 2024-01-01 to 2026-09-24.

- `date`: the day (inferred).
- `dau`, `wau`, `mau`: daily, weekly, monthly active users as platform-wide totals (inferred). Not per user and not per plan, so it cannot identify at-risk subscribers.

Verdict: Caution. Aggregate only; Sep 2025 anomaly applies (quirk: September 2025 spike).

