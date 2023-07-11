Create table ps1_orders (order_number int, customer_number int);

insert into ps1_orders (order_number, customer_number) values ('1', '1');
insert into ps1_orders (order_number, customer_number) values ('2', '2');
insert into ps1_orders (order_number, customer_number) values ('3', '3');
insert into ps1_orders (order_number, customer_number) values ('4', '3');

select * from ps1_orders


# Write an sql query to find the customer number for customer who has largest number of orders
/*
	Output:
			Customer_number
				3
	

*/


select 
	customer_number 
from 
	ps1_orders
where order_number = (select max(order_number) from ps1_orders po)




select 
	customer_number 
from 
	(
	select customer_number,count(*) as total_order_by_customer from ps1_orders
	group by customer_number 
	order by total_order_by_customer desc
) tmp limit 1;
