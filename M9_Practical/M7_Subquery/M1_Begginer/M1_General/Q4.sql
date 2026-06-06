/*
Note : See the percentage cacluation in data science folder
*/




/*

*) Check how many users watched less than 20%
*) If more than half of users did this , then return that content id


*/  


/*
Sample Input

| user_id | content_id | watch_time | total_duration |
| ------- | ---------- | ---------- | -------------- |
| 1       | 1          | 10         | 100            |
| 2       | 1          | 15         | 100            |
| 3       | 1          | 18         | 100            |
| 4       | 1          | 90         | 100            |
| 1       | 2          | 90         | 100            |
| 2       | 2          | 80         | 100            |
| 3       | 2          | 70         | 100            |
| 4       | 2          | 10         | 100            |
| 1       | 3          | 5          | 100            |
| 2       | 3          | 10         | 100            |
| 3       | 3          | 15         | 100            |

Sample Output :

| content_id |
| ---------- |
| 1          |
| 3          |


*/

/*
CREATE or replace TABLE watch_history (
    user_id INT,
    content_id INT,
    watch_time FLOAT,       -- in seconds or minutes watched
    total_duration FLOAT    -- total length of the content
);

INSERT INTO watch_history 
(user_id, content_id, watch_time, total_duration) VALUES
(1, 1, 10, 100),   -- 10% watched
(2, 1, 15, 100),   -- 15% watched
(3, 1, 18, 100),   -- 18% watched
(4, 1, 90, 100),   -- 90% watched
(1, 2, 90, 100),   -- 90%
(2, 2, 80, 100),   -- 80%
(3, 2, 70, 100),   -- 70%
(4, 2, 10, 100),   -- 10%
(1, 3, 5, 100),    -- 5%
(2, 3, 10, 100),   -- 10%
(3, 3, 15, 100);   -- 15%

*/



SELECT 
    content_id
FROM watch_history
GROUP BY content_id
HAVING 
    SUM(CASE WHEN watch_time < 20 THEN 1 ELSE 0 END) * 100 / COUNT(*) > 50;



(OR)

WITH watch_pct AS (
    SELECT 
        user_id,
        content_id,
        watch_time,
        total_duration,
        watch_time / total_duration AS watch_pct
    FROM watch_history
)
SELECT 
    *
FROM watch_pct
GROUP BY content_id
HAVING 
    SUM(CASE WHEN watch_pct < 0.2 THEN 1 ELSE 0 END) * 100 / COUNT(*) > 50;


