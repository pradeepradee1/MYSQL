/*

How do you find users with 3+ logins per week consistently over 2 months?

user_id | login_timestamp
U1      | 2025-07-01 08:00:00
U1      | 2025-07-02 09:00:00
U1      | 2025-07-03 10:00:00
U2      | 2025-07-01 11:00:00


*/

/*
CREATE TABLE user_logins2 (
    user_id VARCHAR(10),
    login_timestamp DATETIME
);


INSERT INTO user_logins2 (user_id, login_timestamp) VALUES
('U1', '2025-07-01 08:00:00'),
('U1', '2025-07-02 09:00:00'),
('U1', '2025-07-03 10:00:00'),
('U1', '2025-07-08 11:00:00'),
('U1', '2025-07-10 12:00:00'),
('U1', '2025-07-15 08:00:00'),
('U1', '2025-08-01 09:00:00'),
('U1', '2025-08-02 10:00:00'),
('U1', '2025-08-03 11:00:00'),
('U2', '2025-07-01 11:00:00'),
('U2', '2025-07-02 12:00:00');

*/


WITH weekly_logins AS (
    SELECT 
        user_id,
        YEAR(login_timestamp) AS yr,
        WEEK(login_timestamp, 1) AS week_no,  -- 1 = week starts on Monday
        COUNT(*) AS logins_per_week
    FROM user_logins2
    WHERE login_timestamp >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
    GROUP BY user_id, yr, week_no
),
consistent_users AS (
    SELECT user_id, COUNT(*) AS weeks_with_3plus
    FROM weekly_logins
    WHERE logins_per_week >= 3
    GROUP BY user_id
)
SELECT c.user_id
FROM consistent_users c
JOIN (
    SELECT user_id, COUNT(DISTINCT YEAR(login_timestamp)*100 + WEEK(login_timestamp,1)) AS total_weeks
    FROM user_logins2
    WHERE login_timestamp >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
    GROUP BY user_id
) t
ON c.user_id = t.user_id
WHERE c.weeks_with_3plus = t.total_weeks;
