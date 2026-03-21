/*

Problem :
            We need to find numbers that appear at least 3 times consecutively.

+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+

Expected Output:
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+ 


*/


CREATE or replace TABLE numbers (
    id INT,
    num INT
);

INSERT INTO numbers (id, num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2);


#Apprach 1
SELECT 
    DISTINCT num AS ConsecutiveNums
FROM (
    SELECT id, num,
           LAG(num, 1) OVER (ORDER BY id) AS prev_num,
           LEAD(num, 1) OVER (ORDER BY id) AS next_num
    FROM Numbers
) t
WHERE num = prev_num AND num = next_num;

