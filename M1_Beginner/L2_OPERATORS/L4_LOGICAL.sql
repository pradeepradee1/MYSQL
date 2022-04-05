/*
LOGICAL OPERATOR
	AND
	OR 
*/
use mydb;

#1)
SELECT * FROM car c WHERE c.price = 3300 AND c.name LIKE '%%cond'

#2)
SELECT * FROM car c WHERE c.price = 3300 OR  c.name LIKE '%%cond'

