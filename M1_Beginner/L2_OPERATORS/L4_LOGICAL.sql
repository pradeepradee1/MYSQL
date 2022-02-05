/*
LOGICAL OPERATOR
	AND
	OR 
*/
#1)
SELECT * FROM CAR c WHERE c.price = 2000 AND c.name LIKE '%A2'
#2)
SELECT * FROM CAR c WHERE c.price = 2000 OR  c.name LIKE '%A2'
