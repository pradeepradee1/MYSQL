/*

While this may seem easy, 
generating output without direct input is always intriguing, challenging,
and a magical aspect of SQL.

*/




CREATE or replace TABLE Triangle (
    level INT
);


INSERT INTO Triangle (level) 
VALUES (1),(2),(3),(4),(5);










/* Query */

/*  repeat is scalar functions in string    */
SELECT 
REPEAT('* ', level) AS triangle_row
FROM Triangle
ORDER BY level;
