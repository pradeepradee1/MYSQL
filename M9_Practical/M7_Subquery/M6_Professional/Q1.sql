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



WITH digits AS (
    SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
),
bounds AS (
    SELECT MIN(num) AS min_val, MAX(num) AS max_val FROM Numbers
)
SELECT a.*
FROM digits a
CROSS JOIN bounds b
LEFT JOIN Numbers n 
    ON a.d = n.num
WHERE n.num IS NULL
  AND a.d BETWEEN b.min_val AND b.max_val;



(OR)

WITH digits AS (
    SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
),
numbers AS (
    -- Generate numbers from 1 to 100
    SELECT (t.d * 10 + u.d) + 1 AS num
    FROM digits t
    CROSS JOIN digits u
)

SELECT n.num AS missing_number
FROM numbers n
LEFT JOIN Numbers t
    ON n.num = t.num
WHERE n.num BETWEEN (SELECT MIN(num) FROM Numbers)
                AND (SELECT MAX(num) FROM Numbers)
  AND t.num IS NULL
ORDER BY n.num;
