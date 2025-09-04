/*

IP as
user_id | login_date
--------|------------
1       | 2025-03-01
1       | 2025-03-02
1       | 2025-03-03
1       | 2025-03-04
1       | 2025-03-06
...

OP as 
+-------+----------+----------+----------------+
|user_id|start_date|end_date  |consecutive_days|
+-------+----------+----------+----------------+
|1      |2025-03-10|2025-03-14|5               |
|1      |2025-03-25|2025-03-30|6               |
|3      |2025-03-01|2025-03-05|5               |
+-------+----------+----------+----------------+



*/

WITH dedup AS (
    SELECT DISTINCT user_id, CAST(login_date AS DATE) AS login_date
    FROM user_logins
),
grp AS (
    SELECT 
        user_id,
        login_date,
        DATEADD(DAY, -ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_date), login_date) AS grp_key
    FROM dedup
),
streaks AS (
    SELECT 
        user_id,
        MIN(login_date) AS start_date,
        MAX(login_date) AS end_date,
        COUNT(*) AS consecutive_days
    FROM grp
    GROUP BY user_id, grp_key
)
SELECT *
FROM streaks
WHERE consecutive_days >= 5
ORDER BY user_id, start_date;
