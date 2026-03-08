/*

While this may seem easy, 
generating output without direct input is always intriguing, challenging,
and a magical aspect of SQL.
*/

CREATE or replace TABLE Triangle (
    level INT
);


INSERT INTO Triangle (level) VALUES (1);
INSERT INTO Triangle (level) VALUES (2);
INSERT INTO Triangle (level) VALUES (3);
INSERT INTO Triangle (level) VALUES (4);
INSERT INTO Triangle (level) VALUES (5);


/*  repeat is scalar functions in string    */

SELECT 
REPEAT('* ', level) AS triangle_row
FROM Triangle
ORDER BY level;
