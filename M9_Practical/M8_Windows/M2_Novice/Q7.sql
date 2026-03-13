/*

How would you rank users by login frequency this quarter?


*/

/*
CREATE or replace TABLE user_logins123 (
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

SELECT 
    user_id,
    COUNT(*) AS login_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS login_rank
FROM user_logins123
WHERE DATE_TRUNC('quarter', login_timestamp) = DATE_TRUNC('quarter', CURRENT_DATE)
GROUP BY user_id
ORDER BY login_rank;
