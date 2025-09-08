/*

 Swap Seats!

Problem Summary:
Swap the seat for every two consecutive students. If there’s an odd number of students, the last one stays put.

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1 | Abbot |
| 2 | Doris |
| 3 | Emerson |
| 4 | Green |
| 5 | Jeames |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1 | Doris |
| 2 | Abbot |
| 3 | Green |
| 4 | Emerson |
| 5 | Jeames |
+----+---------+

*/

/*
Solution 1: Using Window functions & CASE (better readability) */

To solve this, I used window functions:
LEAD(student) to look ahead
LAG(student) to look back
Then, with a simple CASE statement:
 If the row is odd and a next student exists → show the next student.
 If the row is even → show the previous student.
 Else → keep the student (for the last one if the count is odd).

WITH next_prev_stu AS (
 SELECT id,
 student,
 LAG(student) OVER (ORDER BY id) AS prev_stu,
 LEAD(student) OVER (ORDER BY id) AS next_stu
 FROM Seat
)
SELECT id,
 CASE 
 WHEN id % 2 = 1 AND next_stu IS NOT NULL THEN next_stu
 WHEN id % 2 = 0 THEN prev_stu
 ELSE student
 END AS student
FROM next_prev_stu
ORDER BY id;


/*
Solution 2: Using IF() : speed and flexibility */

SELECT IF(id < (SELECT MAX(id) FROM Seat),
 IF(id % 2 = 0 , id - 1, id + 1 ),
 IF(id % 2 = 0 , id - 1, id)
 )  AS id, student
FROM  Seat
ORDER BY id