/*

How can you detect missing records in a time-series dataset (e.g., hourly gaps)?

*/

WITH time_series AS (
    SELECT generate_series(
        (SELECT MIN(timestamp) FROM hourly_sales),
        (SELECT MAX(timestamp) FROM hourly_sales),
        interval '1 hour'
    ) AS ts
)
SELECT ts AS missing_timestamp
FROM time_series t
LEFT JOIN hourly_sales h
    ON t.ts = h.timestamp
WHERE h.timestamp IS NULL
ORDER BY ts;
