/*
CONDITIONAL_STATEMENTS

	*) IF
	*) CASE

*/

#2) CASE 

use mydb

SELECT * FROM car c 

#Single When Statement
SELECT
c.car_id ,
c.name ,
c.price ,
CASE 
	WHEN c.price > 2000 THEN 'COSTLY' 
	ELSE 'AFFORD' 
END AS `PRICE_LABEL`
FROM 
car c 


#Multiple WHEN Statement 
SELECT
c.car_id ,
c.name ,
c.price ,
CASE 
	WHEN c.price > 2000 THEN '>2000'
	WHEN c.price < 10 THEN '<10'
	ELSE 'Medium'
END AS `PRICE_LABEL`
FROM 
car c 

