/*
CONDITIONAL_STATEMENTS

	*) IF
	*) CASE	

*/

#1) IF 

use mydatabase

SELECT * FROM CAR c 

SELECT
c.car_id ,
c.name ,
c.price ,
IF (c.price > 2000,'COSTLY','AFFORD') AS 'PRICE_LABEL'
FROM 
CAR c 





