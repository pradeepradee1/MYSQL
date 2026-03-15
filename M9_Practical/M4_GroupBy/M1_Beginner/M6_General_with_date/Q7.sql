/*
Problem :

Find users who logged in every day

*/

CREATE or replace TABLE user_logins (
    user_id INT,
    login_date DATE
);

INSERT INTO user_logins VALUES
(1, '2025-03-01'),
(1, '2025-03-02'),
(1, '2025-03-03'),
(1, '2025-03-04'),
(2, '2025-03-01'),
(2, '2025-03-03'),
(2, '2025-03-04'),
(3, '2025-03-01'),
(3, '2025-03-02'),
(3, '2025-03-03'),
(3, '2025-03-04'),
(3, '2025-03-05');



SELECT 
    user_id
FROM user_logins
GROUP BY user_id
HAVING COUNT(DISTINCT login_date) = DATEDIFF(MAX(login_date), MIN(login_date)) + 1;

