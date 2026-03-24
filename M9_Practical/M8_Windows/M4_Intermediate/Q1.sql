/*

we need find consecutive available sets 

free = 1 → available
free = 0 → not available


Sample Input :

| seat_id | free |
| ------- | ---- |
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 6       | 1    |


Excepted Output :

| start_seat | end_seat |
| ---------- | -------- |
| 1          | 1        |
| 3          | 4        |
| 6          | 6        |



*/



create or replace table cinema 
(seat_id SERIAL primary key, free bool);

insert into cinema (seat_id, free) values 
('1', '1'),
('2', '0'),
('3', '1'),
('4', '1'),
('6', '1');


select * from cinema



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
)

SELECT 
    MIN(seat_id) AS start_seat,
    MAX(seat_id) AS end_seat
FROM grouped
GROUP BY grp
ORDER BY start_seat;