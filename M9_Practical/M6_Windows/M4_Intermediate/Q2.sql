/*

Find users who logged in for at least 15 consecutive days within the same month (e.g., May 2025).

*/

CREATE TABLE logins (
 user_id INT,
 login_date DATE
);

INSERT INTO logins VALUES
(101, '2025-05-01'), (101, '2025-05-02'), (101, '2025-05-03'),
(101, '2025-05-04'), (101, '2025-05-05'), (101, '2025-05-06'),
(101, '2025-05-07'), (101, '2025-05-08'), (101, '2025-05-09'),
(101, '2025-05-10'), (101, '2025-05-11'), (101, '2025-05-12'),
(101, '2025-05-13'), (101, '2025-05-14'), (101, '2025-05-15'),
(101, '2025-05-16'),
(102, '2025-05-01'), (102, '2025-05-03'),
(103, '2025-05-05');


WITH ranked_logins AS (
 SELECT user_id,
 login_date,
 ROW_NUMBER() OVER (PARTITION BY user_id, MONTH(login_date) ORDER BY login_date) AS rn
 FROM logins
),
streaks AS (
 SELECT user_id,
 DATE_SUB(login_date, INTERVAL rn DAY) AS streak_group
 FROM ranked_logins
)
SELECT user_id
FROM (
 SELECT user_id, streak_group, COUNT(*) AS streak_length
 FROM streaks
 GROUP BY user_id, streak_group
) t
WHERE streak_length >= 15
GROUP BY user_id;
