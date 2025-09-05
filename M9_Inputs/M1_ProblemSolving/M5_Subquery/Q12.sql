/*

While this may seem easy, generating output without direct input is always intriguing, challenging, and a magical aspect of SQL.
*/
CREATE TABLE Triangle (
 level INT
);



WITH RECURSIVE Triangle AS (
 SELECT 1 AS level
 UNION ALL
 SELECT level + 1
 FROM Triangle
 WHERE level < 5 -- Change this number for a larger triangle
)
SELECT 
 REPEAT('* ', level) AS triangle_row
FROM 
 Triangle;
