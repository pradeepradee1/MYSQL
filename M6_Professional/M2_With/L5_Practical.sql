/*

Write a recursive CTE to generate numbers 1 to 10.

*/


WITH RECURSIVE numbers AS (
    -- Anchor member (starting point)
    SELECT 1 AS num
    
    UNION ALL
    
    -- Recursive member
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT * FROM numbers;
