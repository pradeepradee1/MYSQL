/*
CONDITIONAL_STATEMENTS

	*) IF
	*) CASE

*/

#2) CASE 

use mydb

SELECT * FROM car c 


SELECT
c.car_id ,
c.name ,
c.price ,
CASE 
	WHEN c.price > 2000 
	THEN 'COSTLY' 
	ELSE 'AFFORD' 
END AS `PRICE_LABEL`
FROM 
car c 

