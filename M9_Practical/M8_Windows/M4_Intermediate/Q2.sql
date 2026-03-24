/*

Question :

You need to return streaks of 5 or more consecutive login days per user

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
|1      |2025-03-10|2025-03-14|    5           |
|1      |2025-03-25|2025-03-30|    6           |
|3      |2025-03-01|2025-03-05|    5           |
+-------+----------+----------+----------------+



*/


CREATE or replace TABLE user_logins1 (
    user_id INT,
    login_date DATE
);


INSERT INTO user_logins1 (user_id, login_date) VALUES
(1, '2025-03-10'),
(1, '2025-03-11'),
(1, '2025-03-12'),
(1, '2025-03-13'),
(1, '2025-03-14'),
(1, '2025-03-25'),
(1, '2025-03-26'),
(1, '2025-03-27'),
(1, '2025-03-28'),
(1, '2025-03-29'),
(1, '2025-03-30'),
(3, '2025-03-01'),
(3, '2025-03-02'),
(3, '2025-03-03'),
(3, '2025-03-04'),
(3, '2025-03-05');


WITH numbered AS (
    SELECT
        user_id,
        login_date,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_date) AS rn
    FROM user_logins1
),
grouped AS (
    SELECT
        user_id,
        login_date,
        DATE_SUB(login_date, INTERVAL rn DAY) AS grp_key
    FROM numbered
)
SELECT
    user_id,
    MIN(login_date) AS start_date,
    MAX(login_date) AS end_date,
    COUNT(*) AS consecutive_days
FROM grouped
GROUP BY user_id, grp_key
ORDER BY user_id, start_date;
