/*
CONDITIONAL_STATEMENTS

	*) IF
	*) CASE

*/

#2) IF

use mydb

SELECT * FROM car c 


SELECT
c.car_id ,
c.name ,
c.price ,
if (c.price > 2000 , "Costly","afford") as pricelist
from
car c 


