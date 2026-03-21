/*

Rank users based on number of logins in the current quarter
(OR)
How would you rank users by login frequency this quarter?


user_id | login_timestamp
--------|-----------------
U1      | 2025-07-01
U1      | 2025-07-02
U1      | 2025-08-15
U2      | 2025-07-03
U2      | 2025-09-10
U3      | 2025-09-20
U3      | 2025-09-21
U3      | 2025-09-22
U4      | 2025-07-05

Output:

user_id | login_count | rank
--------|-------------|------
U1      | 3           | 1
U3      | 3           | 1
U2      | 2           | 3
U4      | 1           | 4



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

WITH cte AS (
    SELECT 
        user_id,
        COUNT(*) AS login_count
    FROM user_logins123
    WHERE login_timestamp BETWEEN '2025-07-01' AND '2025-09-30'
    GROUP BY user_id
)
SELECT 
    user_id,
    login_count,
    RANK() OVER (ORDER BY login_count DESC) AS rank
FROM cte
ORDER BY rank;