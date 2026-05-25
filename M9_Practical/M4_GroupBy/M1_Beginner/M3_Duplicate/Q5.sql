/*

Identifying Daily Active Users (DAU) Per Day and Per hour



Excepeted OP

| login_date | login_hour | hourly_active_users |
| ---------- | ---------- | ------------------- |
| 2025-10-10 | 9          | 2                   |
| 2025-10-10 | 10         | 1                   |
| 2025-10-10 | 11         | 2                   |
| 2025-10-11 | 8          | 2                   |
| 2025-10-11 | 9          | 2                   |
| 2025-10-12 | 14         | 2                   |
| 2025-10-12 | 15         | 2                   |


*/



CREATE TABLE user_activity1 (
    user_id INT,
    login_time TIMESTAMP
);

INSERT INTO user_activity1 (user_id, login_time) VALUES
(1, '2025-10-10 09:15:00'),
(2, '2025-10-10 09:45:00'),
(1, '2025-10-10 10:05:00'),
(1, '2025-10-10 10:30:00'), -- duplicate same hour
(3, '2025-10-10 11:00:00'),
(2, '2025-10-10 11:10:00'),

(1, '2025-10-11 08:10:00'),
(2, '2025-10-11 08:20:00'),
(2, '2025-10-11 08:50:00'), -- duplicate same hour
(3, '2025-10-11 09:05:00'),
(4, '2025-10-11 09:30:00'),

(1, '2025-10-12 14:00:00'),
(1, '2025-10-12 14:15:00'), -- duplicate same hour
(2, '2025-10-12 14:45:00'),
(3, '2025-10-12 15:00:00'),
(4, '2025-10-12 15:20:00');



SELECT 
    DATE(login_time) AS login_date,
    EXTRACT(HOUR FROM login_time) AS login_hour,
    COUNT(DISTINCT user_id) AS hourly_active_users
FROM user_activity1
GROUP BY 
    DATE(login_time),
    EXTRACT(HOUR FROM login_time)
ORDER BY 
    login_date,
    login_hour;