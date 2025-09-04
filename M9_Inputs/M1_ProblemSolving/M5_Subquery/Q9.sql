/*


data = [
 (1, '2025-03-01'), (1, '2025-03-02'), (1, '2025-03-03'),
 (1, '2025-03-04'), (1, '2025-03-06'), (1, '2025-03-10'),
 (1, '2025-03-11'), (1, '2025-03-12'), (1, '2025-03-13'),
 (1, '2025-03-14'), (1, '2025-03-25'), (1, '2025-03-26'),
 (1, '2025-03-27'), (1, '2025-03-28'), (1, '2025-03-29'),
 (1, '2025-03-30'), (2, '2025-03-01'), (2, '2025-03-02'),
 (2, '2025-03-03'), (2, '2025-03-04'), (3, '2025-03-01'),
 (3, '2025-03-02'), (3, '2025-03-03'), (3, '2025-03-04'),
 (3, '2025-03-04'), (3, '2025-03-04'), (3, '2025-03-05')
]


*/


WITH dedup AS (
    SELECT DISTINCT user_id, CAST(login_date AS DATE) AS login_date
    FROM user_login
),
grp AS (
    SELECT
        user_id,
        login_date,
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
