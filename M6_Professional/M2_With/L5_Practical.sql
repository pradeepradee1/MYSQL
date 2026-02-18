/*

Write a recursive CTE to generate numbers 1 to 10.

*/


WITH RECURSIVE numbers AS (
    SELECT 1 AS num -- Anchor member (starting point)
    UNION 
    SELECT num + 1 FROM numbers WHERE num < 10
)
SELECT * FROM numbers;

