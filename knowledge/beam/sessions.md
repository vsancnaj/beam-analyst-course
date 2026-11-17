# sessions

Grain (a guess from the data, confirm it): one row per session_id. 4,335,470 rows, no duplicate ids, 29,568 distinct users.

Profile came from the database (course-db), not a CSV: `sessions` has no CSV. Definitions come from `sessions.yml`.

## Columns

| Name | Nulls | Notes |
| --- | --- | --- |
| session_id | 0 | 4,335,470 distinct, matches row count |
| user_id | 0 | 29,568 distinct |
| session_date | 0 | always midnight (0 rows with a time of day) |
| duration_minutes | 0 | 1 to 157 |
| activity_type | 0 | browse, listen, read |

## Date ranges

- `session_date`: 2022-01-12 to 2026-09-26. 273 rows fall after the analysis date of 2026-09-24; leave them out.

## Low-cardinality values

- `activity_type`: browse (2,597,635), listen (1,306,227), read (431,608)

## Meaning

- `session_date`: the day of the session, no time of day, so sessions cannot be ordered within a day (inferred from the profile).
- `duration_minutes`: length of the session, at least 1 minute.
- `activity_type`: what the user mainly did in the session.

Verdict: Proceed, with care. Aggregate in SQL (4.3 million rows) and filter `session_date <= 2026-09-24`. Day-level questions work; within-day timing does not.
