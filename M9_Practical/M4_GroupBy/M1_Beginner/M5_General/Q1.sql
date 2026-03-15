/*

Questions:

Write an sql query to find the customer number for customer who has most number of orders


	for ex : 1 and 2 are placed each order
			   3 is placed two orders which is larger no. of orders than it

	
	Output:
			Customer_number
				3


*/



Create or replace table Temp (order_number int, customer_number int);

insert into Temp (order_number, customer_number) values ('1', '1');
insert into Temp (order_number, customer_number) values ('2', '2');
insert into Temp (order_number, customer_number) values ('3', '3');
insert into Temp (order_number, customer_number) values ('4', '3');

select * from Temp






#Right Approach
SELECT customer_number
FROM Temp
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;


#Right Approach
select 
	customer_number 
from 
	(
		select customer_number,count(*) as total_order_by_customer from ps1_orders 
		group by customer_number  
		order by total_order_by_customer desc
	) tmp 
limit 1;


#Right Approach

select 
	* 
from 
	ps1_orders
where
	 customer_number = (select customer_number as cid from ps1_orders 
	 					group by customer_number 
	 					order by count(*) desc limit 0,1) 
limit 0,1
