/*

How do you find users with 3+ logins per week consistently over 2 months?

user_id | login_timestamp

U1      | 2025-07-01 08:00:00
U1      | 2025-07-02 09:00:00
U1      | 2025-07-03 10:00:00
U2      | 2025-07-01 11:00:00


*/

/*

CREATE OR REPLACE TABLE user_logins2 (
    user_id VARCHAR(10),
    login_timestamp DATETIME
);

INSERT INTO user_logins2 VALUES
('U1','2025-07-01 08:00:00'),
('U1','2025-07-02 09:00:00'),
('U1','2025-07-03 10:00:00'),
('U1','2025-07-08 08:00:00'),
('U1','2025-07-09 09:00:00'),
('U1','2025-07-10 10:00:00'),
('U1','2025-07-15 08:00:00'),
('U1','2025-07-16 09:00:00'),
('U1','2025-07-17 10:00:00'),
('U1','2025-07-22 08:00:00'),
('U1','2025-07-23 09:00:00'),
('U1','2025-07-24 10:00:00'),
('U1','2025-08-01 08:00:00'),
('U1','2025-08-02 09:00:00'),
('U1','2025-08-03 10:00:00'),
('U1','2025-08-08 08:00:00'),
('U1','2025-08-09 09:00:00'),
('U1','2025-08-10 10:00:00'),
('U1','2025-08-15 08:00:00'),
('U1','2025-08-16 09:00:00'),
('U1','2025-08-17 10:00:00'),
('U1','2025-08-22 08:00:00'),
('U1','2025-08-23 09:00:00'),
('U1','2025-08-24 10:00:00'),
('U2','2025-07-01 11:00:00'),
('U2','2025-07-02 12:00:00');

*/

select * from user_logins2


WITH weekly_logins AS (
    SELECT 
        user_id,
        YEAR(login_timestamp) AS yr,
        WEEK(login_timestamp) AS wk,
        COUNT(*) AS login_count
    FROM user_logins2
    GROUP BY user_id, YEAR(login_timestamp), WEEK(login_timestamp)
)

SELECT user_id
FROM weekly_logins
WHERE login_count >= 3
GROUP BY user_id
HAVING COUNT(*) >= 8;