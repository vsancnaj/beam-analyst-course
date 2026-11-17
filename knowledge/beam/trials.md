# trials

Grain (a guess from the data, confirm it): one row per trial_id. 2,073 rows. No duplicate ids. Each user_id appears once (2,073 distinct).

## Columns

| Name | Type | Null rate | Distinct |
| --- | --- | --- | --- |
| trial_id | int64 | 0.00% | 2,073 |
| user_id | int64 | 0.00% | 2,073 |
| started_at | datetime64[ns] | 0.00% | 2,071 |
| ends_at | datetime64[ns] | 0.00% | 2,071 |
| outcome | object | 20.16% | 2 |
| outcome_at | datetime64[ns] | 20.16% | 1,655 |

## Date ranges

- `started_at`: 2026-08-01T00:29:17 to 2026-09-24T22:59:05
- `ends_at`: 2026-08-15T00:29:17 to 2026-10-08T22:59:05
- `outcome_at`: 2026-08-06T05:37:23 to 2026-09-24T23:55:08

## Low-cardinality values

- `outcome`: converted (828), canceled (827), empty (418)

## Meaning

Profile came from `data/trials.csv` via `helpers/profile.py`. Definitions come from `trials.yml`.

- `trial_id`: key (inferred).
- `user_id`: the user who started the trial; one trial per user (per `trials.yml`).
- `started_at`, `ends_at`: 14-day full-access trial window; `ends_at` is 14 days after `started_at` (per `trials.yml`).
- `outcome`: converted or canceled; empty means the trial is still open, not a failure. Explained by quirk "Trials mature late".
- `outcome_at`: when the outcome happened; empty exactly when `outcome` is empty.

Verdict: Proceed. The 20.16% null rate on `outcome` and `outcome_at` is the open trials, already explained by the quirk. Use mature trials only (`ends_at` on or before 2026-09-24).
