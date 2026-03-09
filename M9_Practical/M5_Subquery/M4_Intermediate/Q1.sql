/*

How do you find users with 3+ logins per week consistently over 2 months?

user_id | login_timestamp
U1      | 2025-07-01 08:00:00
U1      | 2025-07-02 09:00:00
U1      | 2025-07-03 10:00:00
U2      | 2025-07-01 11:00:00


*/

/*
CREATE or replace TABLE user_logins2 (
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
        YEAR(login_timestamp) AS login_year,
        WEEK(login_timestamp) AS login_week,
        COUNT(*) AS login_count
    FROM user_logins2
    GROUP BY user_id, YEAR(login_timestamp), WEEK(login_timestamp)
),

qualified_weeks AS (
    SELECT *
    FROM weekly_logins
    WHERE login_count >= 3
)

SELECT user_id
FROM qualified_weeks
GROUP BY user_id
HAVING COUNT(*) >= 8;