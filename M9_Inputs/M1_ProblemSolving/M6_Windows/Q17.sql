/*

How would you rank users by login frequency this quarter?


*/

WITH quarterly_logins AS (
    SELECT
        user_id,
        COUNT(*) AS login_count
    FROM user_logins
    WHERE QUARTER(login_timestamp) = QUARTER(CURDATE())
      AND YEAR(login_timestamp) = YEAR(CURDATE())
    GROUP BY user_id
)
SELECT 
    user_id,
    login_count,
    RANK() OVER (ORDER BY login_count DESC) AS login_rank
FROM quarterly_logins
ORDER BY login_rank;
