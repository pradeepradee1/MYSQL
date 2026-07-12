/*

1) Remove duplicate logins by the same user on the same day
2) Count the number of unique users who logged in each day (Daily Active Users - DAU)


*/


/*

CREATE TABLE user_activity1 (
    user_id INT,
    login_date DATE
);


INSERT INTO user_activity1 (user_id, login_date) VALUES
(1, '2025-10-10'),
(2, '2025-10-10'),
(1, '2025-10-11'),
(3, '2025-10-11'),
(2, '2025-10-11'),
(1, '2025-10-12'),
(4, '2025-10-12'),
(3, '2025-10-12'),
(1, '2025-10-12'),  -- duplicate same day login (should still count once)
(5, '2025-10-13'),
(2, '2025-10-13'),
(1, '2025-10-13');

Sample Input :

| user_id | login_date |                                         |
| ------: | :--------- | --------------------------------------- |
|       1 | 2025-10-10 |                                         |
|       2 | 2025-10-10 |                                         |
|       1 | 2025-10-11 |                                         |
|       3 | 2025-10-11 |                                         |
|       2 | 2025-10-11 |                                         |
|       1 | 2025-10-12 |                                         |
|       4 | 2025-10-12 |                                         |
|       3 | 2025-10-12 |                                         |
|       1 | 2025-10-12 | ← Duplicate login (same user, same day) |
|       5 | 2025-10-13 |                                         |
|       2 | 2025-10-13 |                                         |
|       1 | 2025-10-13 |                                         |

Sample Output :

| login_date | daily_active_users |
| :--------- | -----------------: |
| 2025-10-10 |                  2 |
| 2025-10-11 |                  3 |
| 2025-10-12 |                  3 |
| 2025-10-13 |                  3 |





*/

SELECT 
    login_date,
    COUNT(DISTINCT user_id) AS daily_active_users
FROM 
    user_activity1
GROUP BY 
    login_date
ORDER BY 
    login_date;

