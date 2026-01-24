/*

 How would you identify users who upgraded to premium within 7 days of signup?


*/

/*
CREATE or replace TABLE Temp (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    signup_date DATE,
    premium_upgrade_date DATE
);

INSERT INTO Temp (user_id, user_name, signup_date, premium_upgrade_date) 
VALUES
(1, 'Alice',  DATE '2025-10-01', DATE '2025-10-05'),   -- 4 days -> within 7
(2, 'Bob',    DATE '2025-10-01', DATE '2025-10-10'),   -- 9 days -> NOT within 7
(3, 'Charlie',DATE '2025-10-03', NULL),                -- never upgraded
(4, 'David',  DATE '2025-10-02', DATE '2025-10-06'),   -- 4 days -> within 7
(5, 'Eva',    DATE '2025-10-05', DATE '2025-10-20');   -- 15 days -> NOT within 7

*/

SELECT 
    user_id,
    user_name,
    signup_date,
    premium_upgrade_date,
    (premium_upgrade_date - signup_date) AS days_to_upgrade
FROM Temp
WHERE premium_upgrade_date IS NOT NULL
  AND premium_upgrade_date <= signup_date + INTERVAL '7' DAY;

