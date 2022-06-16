/*
CONDITIONAL_STATEMENTS

	*) IF
	*) CASE

*/

#1) IF
use mydb

SELECT * FROM car c 

#Single If 
SELECT
c.car_id ,
c.name ,
c.price ,
if (c.price > 2000 , "Costly","afford") as pricelist
from
car c 


#Multiple If
SELECT
c.car_id ,
c.name ,
if (c.name = 'first' , "firstname","notfirstname") as namedesc,
c.price ,
if (c.price > 2000 , "Costly","afford") as pricelist
from
car c 


#Nested If
SELECT
c.car_id ,
c.name ,
c.price ,
if (c.price > 2000 ,if (c.name='second',"SecondName","NotSecondName"),"NotSecondName") as pricelist
from
car c 


