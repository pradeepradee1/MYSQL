/*

Give me the prime numbers 

Input :

| num |
| --- |
| 1   |
| 2   |
| 3   |
| 4   |
| 5   |
| 6   |
| 7   |
| 8   |
| 9   |
| 10  |

Output :

| num |
| --- |
| 2   |
| 3   |
| 5   |
| 7   |


Note : 
        num % 2     ---> This is for finding the moduls or quatient
        num % num   ---> This is for finding divisible by its own number

*/


CREATE or replace TABLE Numbers (
    num INT
);  


INSERT INTO Numbers (num) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);



SELECT a.num
FROM Numbers a
WHERE a.num > 1
AND NOT EXISTS (
    SELECT 1
    FROM Numbers b
    WHERE b.num > 1
    AND b.num < a.num
    AND a.num % b.num = 0
)
ORDER BY a.num;