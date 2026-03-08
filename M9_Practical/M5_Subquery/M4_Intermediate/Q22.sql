/*

find users with 3+ consecutive hourly logins on the same day

*/

/*

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


WITH login_data AS (
    SELECT 
        user_id,
        DATE(login_time) AS login_date,
        login_time,
        LAG(login_time, 1) OVER (PARTITION BY user_id, DATE(login_time) ORDER BY login_time) AS prev_login,
        LAG(login_time, 2) OVER (PARTITION BY user_id, DATE(login_time) ORDER BY login_time) AS prev2_login
    FROM user_logins
)
SELECT DISTINCT user_id, login_date
FROM login_data
WHERE 
    prev_login IS NOT NULL
    AND prev2_login IS NOT NULL
    AND TIMESTAMPDIFF(HOUR, prev_login, login_time) = 1
    AND TIMESTAMPDIFF(HOUR, prev2_login, prev_login) = 1
ORDER BY user_id, login_date;



