/*

| user\_id | login\_time         |                                                  |
| -------- | ------------------- | ------------------------------------------------ |
| 1        | 2025-09-01 09:00:00 |                                                  |
| 1        | 2025-09-01 10:00:00 |                                                  |
| 1        | 2025-09-01 11:00:00 | ✅ (3 consecutive logins same day)                |
| 1        | 2025-09-02 08:00:00 |                                                  |
| 2        | 2025-09-01 07:30:00 |                                                  |
| 2        | 2025-09-01 08:15:00 |                                                  |
| 2        | 2025-09-01 10:00:00 | ❌ (not consecutive, gap)                         |
| 3        | 2025-09-01 06:00:00 |                                                  |
| 3        | 2025-09-01 07:00:00 |                                                  |
| 3        | 2025-09-01 08:00:00 | ✅ (3 consecutive logins same day)                |
| 3        | 2025-09-01 09:00:00 | ✅ (actually 4 consecutive logins → still counts) |


*/

/*

Output :

user_id | login_date
--------+------------
1       | 2025-09-01
3       | 2025-09-01

*/



WITH login_data AS (
    SELECT 
        user_id,
        DATE(login_time) AS login_date,
        login_time,
        ROW_NUMBER() OVER (PARTITION BY user_id, DATE(login_time) ORDER BY login_time) AS rn
    FROM User_login
),
check_seq AS (
    SELECT 
        l1.user_id,
        l1.login_date
    FROM login_data l1
    JOIN login_data l2 
        ON l1.user_id = l2.user_id 
       AND l1.login_date = l2.login_date
       AND l1.rn = l2.rn - 1
    JOIN login_data l3 
        ON l1.user_id = l3.user_id 
       AND l1.login_date = l3.login_date
       AND l1.rn = l3.rn - 2
)
SELECT DISTINCT user_id, login_date
FROM check_seq;



