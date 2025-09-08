/*

How do you find users with 3+ logins per week consistently over 2 months?

user_id | login_timestamp
U1      | 2025-07-01 08:00:00
U1      | 2025-07-02 09:00:00
U1      | 2025-07-03 10:00:00
U2      | 2025-07-01 11:00:00
...


*/


WITH weekly_logins AS (
    SELECT
        user_id,
        YEAR(login_timestamp) AS yr,
        WEEK(login_timestamp, 1) AS week_num, -- ISO week
        COUNT(*) AS logins_per_week
    FROM user_logins
    WHERE login_timestamp >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
    GROUP BY user_id, YEAR(login_timestamp), WEEK(login_timestamp, 1)
),
consistent_weeks AS (
    SELECT
        user_id,
        COUNT(*) AS weeks_with_3plus_logins
    FROM weekly_logins
    WHERE logins_per_week >= 3
    GROUP BY user_id
)
SELECT user_id
FROM consistent_weeks w
JOIN (
    -- total number of weeks in the 2-month period
    SELECT CEIL(DATEDIFF(CURDATE(), DATE_SUB(CURDATE(), INTERVAL 2 MONTH))/7) AS total_weeks
) t
ON w.weeks_with_3plus_logins = t.total_weeks;
