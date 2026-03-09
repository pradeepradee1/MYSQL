/*

Questions : 
    users who logged in for 5 or more consecutive days.

*/

/*

CREATE or replace TABLE user_login (
    user_id INT,
    login_date DATE
);


INSERT INTO user_login (user_id, login_date) VALUES
(1, '2025-09-01'),
(1, '2025-09-02'),
(1, '2025-09-03'),
(1, '2025-09-04'),
(1, '2025-09-05'),
(1, '2025-09-06'),
(2, '2025-09-01'),
(2, '2025-09-02'),
(2, '2025-09-03'),
(3, '2025-09-01'),
(3, '2025-09-02'),
(3, '2025-09-03'),
(3, '2025-09-04'),
(3, '2025-09-06'),
(3, '2025-09-07'),
(3, '2025-09-08'),
(3, '2025-09-09'),
(3, '2025-09-10');

*/

WITH dedup AS (
    SELECT DISTINCT user_id, CAST(login_date AS DATE) AS login_date
    FROM user_login
),
grp AS (
    SELECT user_id,login_date,
        login_date - INTERVAL (ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY login_date)) DAY AS grp_key
    FROM dedup
)
SELECT 
    user_id,
    MIN(login_date) AS start_date,
    MAX(login_date) AS end_date,
    COUNT(*) AS consecutive_days
FROM grp
GROUP BY user_id, grp_key
HAVING COUNT(*) >= 5
ORDER BY user_id, start_date;

