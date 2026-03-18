/*

numbers: 1, 2, 3, 4, 5, 10.

Find the missing numbers between the minimum and maximum. 

The Challenge: Recursive CTEs are NOT allowed. You must use a non-recursive approach.

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
(10);


WITH bounds AS (
    SELECT MIN(num) AS min_val, MAX(num) AS max_val
    FROM numbers
),
seq AS (
    SELECT min_val + n AS num
    FROM bounds
    CROSS JOIN (
        SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 
        UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 
        UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
    ) t
    WHERE min_val + n <= max_val
)

SELECT s.num AS missing_number
FROM seq s
LEFT JOIN numbers n
ON s.num = n.num
WHERE n.num IS NULL;