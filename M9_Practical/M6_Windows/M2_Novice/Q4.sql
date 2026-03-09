/*

Question :
            We need to find numbers that appear at least 3 times consecutively.

+----+-----+
| id | num |
+----+-----+
| 1 | 1 |
| 2 | 1 |
| 3 | 1 |
| 4 | 2 |
| 5 | 1 |
| 6 | 2 |
| 7 | 2 |
+----+-----+

Expected Output:
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+ 


*/


CREATE TABLE numbers (
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


#Apprach 2
SELECT DISTINCT n1.num AS ConsecutiveNums
FROM numbers n1
JOIN numbers n2 ON n1.id = n2.id - 1
JOIN numbers n3 ON n1.id = n3.id - 2
WHERE n1.num = n2.num 
  AND n2.num = n3.num;
