/*

How would you rank users by login frequency this quarter?


*/

/*
CREATE TABLE user_logins123 (
    user_id VARCHAR(10),
    login_timestamp DATE
);

INSERT INTO user_logins123 VALUES
('U1', '2025-07-01'),
('U1', '2025-07-02'),
('U1', '2025-08-15'),
('U2', '2025-07-03'),
('U2', '2025-09-10'),
('U3', '2025-09-20'),
('U3', '2025-09-21'),
('U3', '2025-09-22'),
('U4', '2025-07-05');
*/

WITH current_quarter AS (
    SELECT 
        user_id,
        COUNT(*) AS login_count
    FROM user_logins123	
    WHERE login_timestamp >= DATE_FORMAT(CURDATE(), '%Y-%m-01') - INTERVAL (MONTH(CURDATE())-1) % 3 MONTH
      AND login_timestamp < (DATE_FORMAT(CURDATE(), '%Y-%m-01') - INTERVAL (MONTH(CURDATE())-1) % 3 MONTH) + INTERVAL 3 MONTH
    GROUP BY user_id
)
SELECT 
    user_id,
    login_count,
    RANK() OVER (ORDER BY login_count DESC) AS rank_by_logins
FROM current_quarter
ORDER BY rank_by_logins;
