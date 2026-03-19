/*

How can you detect missing records in a time-series dataset (e.g., hourly gaps)?

*/


/*
CREATE or replace TABLE hourly_data (
    record_id INT,
    record_time DATETIME,
    value INT
);


INSERT INTO hourly_data (record_id, record_time, value) VALUES
(1, '2025-10-20 00:00:00', 10),
(2, '2025-10-20 01:00:00', 15),
(3, '2025-10-20 03:00:00', 20),  -- missing 02:00
(4, '2025-10-20 04:00:00', 25),
(5, '2025-10-20 06:00:00', 30);  -- missing 05:00


Sample Input :

record_id | record_time         | value
----------|---------------------|------
1         | 2025-10-20 00:00:00 | 10
2         | 2025-10-20 01:00:00 | 15
3         | 2025-10-20 03:00:00 | 20
4         | 2025-10-20 04:00:00 | 25
5         | 2025-10-20 06:00:00 | 30

Sample Output :

missing_time
---------------------
2025-10-20 02:00:00
2025-10-20 05:00:00

*/

WITH RECURSIVE all_hours AS (
    SELECT MIN(record_time) AS hour_time
    FROM hourly_data
    UNION ALL
    SELECT DATE_ADD(hour_time, INTERVAL 1 HOUR)
    FROM all_hours
    WHERE hour_time < (SELECT MAX(record_time) FROM hourly_data)
)
SELECT 
    hour_time AS missing_hour
FROM all_hours h
LEFT JOIN hourly_data d
    ON h.hour_time = d.record_time
WHERE d.record_time IS NULL
ORDER BY hour_time;
