/*

find 3 consecutive free seats only” (very common twist)


| seat_id | free |
| ------- | ---- |
| 1       | 1    |
| 2       | 1    |
| 3       | 1    |
| 4       | 0    |
| 5       | 1    |
| 6       | 1    |
| 7       | 1    |
| 8       | 1    |
| 9       | 0    |

Output :

| start_seat | end_seat | total_seats |
| ---------- | -------- | ----------- |
| 1          | 3        | 3           |
| 5          | 8        | 4           |


*/


CREATE or replace TABLE cinema (
    seat_id INT PRIMARY KEY,
    free INT   -- 1 = free, 0 = occupied
);


INSERT INTO cinema (seat_id, free) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 0),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 0),
(10, 1),
(11, 0);



WITH free_seats AS (
    SELECT 
        seat_id,
        ROW_NUMBER() OVER (ORDER BY seat_id) AS rn
    FROM cinema
    WHERE free = 1
),

grouped AS (
    SELECT 
        seat_id,
        seat_id - rn AS grp
    FROM free_seats
),

ranges AS (
    SELECT 
        MIN(seat_id) AS start_seat,
        MAX(seat_id) AS end_seat,
        COUNT(*) AS total_seats
    FROM grouped
    GROUP BY grp
)

SELECT *
FROM ranges
WHERE total_seats >= 3
ORDER BY start_seat;