/*
CONDITIONAL_STATEMENTS

	*) IF
	*) CASE (elif)

#2) CASE 

How it works ?	

				It is similar to if_else in python

 				It will go first When , if it is true
				Once a condition is true, it will stop reading (or) will'nt go the next when and return the result.
*/



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




#Sum in case
select 
    merchant_id,
    sum(case when payment_mode = 'CASH' then amount else 0 end) as cash_amount
    # case sum(when payment_mode = 'CASH' then amount else 0) end as cash_amount #
from 
    transactions 
group by 
    merchant_id; 