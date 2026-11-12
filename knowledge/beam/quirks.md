# Beam data quirks

Things we know about our own tables. Check this list before reading a number as a finding.

- **Monthly price change.** The monthly plan price rose from $10 to $12 in March 2026. Monthly payments before and after that point differ for that reason, not because of a data problem.
- **Trials mature late.** Trials launched on 2026-08-01 and last 14 days. A trial's outcome is only known once it matures, so recent trials show `outcome` empty. Those are still open and must not be counted as failures.
- **Free plans never end.** Rows with `subscriptions.plan = 'free'` have no `end_date`. Exclude them from any churn or retention calculation.
- **Future end dates.** `subscriptions.end_date` can be in the future for scheduled cancellations. A subscription with a future end date is still active today.
- **Future start dates.** A few subscriptions have a `start_date` after today: they are scheduled starts, mostly trials that will convert when they mature. Exclude rows that start after the analysis date from any count of what has happened.
- **September 2025 spike.** September 2025 shows a signup spike of roughly five times a normal month, with a matching jump in the active base and in monthly actives. The daily-to-monthly active ratio falls from about .25 to about .21 at that point. Treat it as a known anomaly and say so whenever it enters a comparison.
- **July 2026 start spike.** July 2026 shows about 491 monthly-plan starts against roughly 200 in a normal month. It is a data quirk, not a promotion or campaign, so those subscribers need no special treatment. Name it when it enters a comparison. The August 2026 rise in starts (about 323) is different: it is real, driven by the free trial launch on 2026-08-01. Confirmed by Andres Vourakis (instructor) on 2026-11-12.
- **Ended label changed in August 2026.** Subscriptions that ended before August 2026 carry `status = 'expired'`; from August 2026 on, ended subscriptions carry `status = 'canceled'`. Both mean the subscriber has left. Count `canceled` and `expired` together as churn; never compare the two labels as different behaviours. Confirmed by Adel Hassen (instructor) on 2026-11-12.
- **Timestamps everywhere.** Dates in the exports are timestamps. Many `users.signup_date` and subscription dates carry midnight times, others carry real times; compare on dates, not on timestamps, unless the time of day matters.
