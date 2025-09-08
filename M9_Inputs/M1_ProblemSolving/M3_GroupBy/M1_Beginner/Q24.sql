/*

 How would you identify daily active users (logged in at least once)?

*/

SELECT
    DATE(timestamp) AS login_date,
    COUNT(DISTINCT user_id) AS daily_active_users
FROM user_activity_logs
WHERE activity_type = 'LOGIN'
GROUP BY DATE(timestamp)
ORDER BY login_date;
