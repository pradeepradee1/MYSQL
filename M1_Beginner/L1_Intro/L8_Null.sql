/*
NULL VALUES :

1)	A missed value in a column is known null value.
2)	Null value is not equal to zero or space or other null values.

*/
use mydb;

SELECT 
* 
FROM 
car c
WHERE c.name IS NULL  