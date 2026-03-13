/*

Give me the prime numbers 

*/


CREATE TABLE Numbers (
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
    WHERE b.num < a.num
    AND b.num > 1
    AND a.num % b.num = 0
)
ORDER BY a.num;