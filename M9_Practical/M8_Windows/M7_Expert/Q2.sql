/*

Find users who logged in for at least 15 consecutive days within the same month (e.g., May 2025).


Sample Input :


| user_id | login_date |
| ------- | ---------- |
| 101     | 2025-05-01 |
| 101     | 2025-05-02 |
| 101     | 2025-05-03 |
| 101     | 2025-05-04 |
| 101     | 2025-05-05 |
| 101     | 2025-05-06 |
| 101     | 2025-05-07 |
| 101     | 2025-05-08 |
| 101     | 2025-05-09 |
| 101     | 2025-05-10 |
| 101     | 2025-05-11 |
| 101     | 2025-05-12 |
| 101     | 2025-05-13 |
| 101     | 2025-05-14 |
| 101     | 2025-05-15 |
| 101     | 2025-05-16 |
| 102     | 2025-05-01 |
| 102     | 2025-05-03 |
| 103     | 2025-05-05 |


Output :

| user_id | start_date | end_date   | days |
| ------- | ---------- | ---------- | ---- |
| 101     | 2025-05-01 | 2025-05-16 | 16   |



*/

CREATE TABLE logins (
 user_id INT,
 login_date DATE
);

INSERT INTO logins VALUES
(101, '2025-05-01'), (101, '2025-05-02'), (101, '2025-05-03'),
(101, '2025-05-04'), (101, '2025-05-05'), (101, '2025-05-06'),
(101, '2025-05-07'), (101, '2025-05-08'), (101, '2025-05-09'),
(101, '2025-05-10'), (101, '2025-05-11'), (101, '2025-05-12'),
(101, '2025-05-13'), (101, '2025-05-14'), (101, '2025-05-15'),
(101, '2025-05-16'),
(102, '2025-05-01'), (102, '2025-05-03'),
(103, '2025-05-05');


WITH base AS (
    SELECT 
        user_id,
        login_date,
        DATE_TRUNC('month', login_date) AS month,
        ROW_NUMBER() OVER (PARTITION BY user_id, DATE_TRUNC('month', login_date) ORDER BY login_date) AS rn
    FROM logins
),
grouped AS (
    SELECT 
        user_id,
        month,
        login_date,
        login_date - INTERVAL '1 day' * rn AS grp
    FROM base
),
streaks AS (
    SELECT 
        user_id,
        month,
        MIN(login_date) AS start_date,
        MAX(login_date) AS end_date,
        COUNT(*) AS days
    FROM grouped
    GROUP BY user_id, month, grp
)
SELECT 
    user_id,
    start_date,
    end_date,
    days
FROM streaks
WHERE days >= 15
ORDER BY user_id;