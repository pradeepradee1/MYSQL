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

CREATE or replace TABLE Temp (
    id INT,
    student VARCHAR(50)
);

INSERT INTO Temp VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');


SELECT 
    CASE 
        WHEN MOD(id, 2) = 1 AND id + 1 <= (SELECT MAX(id) FROM Temp) THEN id + 1 
        WHEN MOD(id, 2) = 0 THEN id - 1 
        ELSE id 
    END AS id,
    student
FROM Temp
ORDER BY id;

