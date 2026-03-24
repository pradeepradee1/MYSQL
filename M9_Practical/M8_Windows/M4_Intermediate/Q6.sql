/*

find users with 3+ consecutive hourly logins on the same day

*/

/*

Input :

| user_id | login_time          |
| ------- | ------------------- |
| 1       | 2025-09-01 09:00:00 |
| 1       | 2025-09-01 10:00:00 |
| 1       | 2025-09-01 11:00:00 |
| 1       | 2025-09-02 08:00:00 |
| 2       | 2025-09-01 07:30:00 |
| 2       | 2025-09-01 08:15:00 |
| 2       | 2025-09-01 10:00:00 |
| 3       | 2025-09-01 06:00:00 |
| 3       | 2025-09-01 07:00:00 |
| 3       | 2025-09-01 08:00:00 |
| 3       | 2025-09-01 09:00:00 |


Output :

user_id | login_date
--------+------------
1       | 2025-09-01
3       | 2025-09-01

*/

/*

create or replace TABLE user_logins (
    user_id INT,
    login_time TIMESTAMP
);

INSERT INTO user_logins (user_id, login_time) VALUES
(1, '2025-09-01 09:00:00'),
(1, '2025-09-01 10:00:00'),
(1, '2025-09-01 11:00:00'),
(1, '2025-09-02 08:00:00'),
(2, '2025-09-01 07:30:00'),
(2, '2025-09-01 08:15:00'),
(2, '2025-09-01 10:00:00'),
(3, '2025-09-01 06:00:00'),
(3, '2025-09-01 07:00:00'),
(3, '2025-09-01 08:00:00'),
(3, '2025-09-01 09:00:00');

*/

WITH base AS (
    SELECT 
        user_id,
        login_time,
        DATE(login_time) AS login_date,
        ROW_NUMBER() OVER (PARTITION BY user_id, DATE(login_time) ORDER BY login_time) AS rn
    FROM user_logins
),
grouped AS (
    SELECT 
        user_id,
        login_date,
        login_time,
        login_time - INTERVAL '1 hour' * rn AS grp
    FROM base
),

streaks AS (
    SELECT 
        user_id,
        login_date,
        COUNT(*) AS cnt
    FROM grouped
    GROUP BY user_id, login_date, grp
)

SELECT DISTINCT user_id, login_date
FROM streaks
WHERE cnt >= 3
ORDER BY user_id, login_date;


