Create table ps1_orders (order_number int, customer_number int);

insert into ps1_orders (order_number, customer_number) values ('1', '1');
insert into ps1_orders (order_number, customer_number) values ('2', '2');
insert into ps1_orders (order_number, customer_number) values ('3', '3');
insert into ps1_orders (order_number, customer_number) values ('4', '3');

select * from ps1_orders


# Write an sql query to find the customer number for customer who has largest number of orders

/*

	# for ex : 1 and 2 are placed each order
			   3 is placed two orders which is larger no. of orders than it

	
	Output:
			Customer_number
				3
	

*/

#this is wrong 
select 
	customer_number 
from 
	ps1_orders
where order_number = (select max(order_number) from ps1_orders po)


#wrong Approach 
#because i am getting more than placed 2 order

select 
	customer_number 
from 
	(
	select customer_number,count(*) as total_order_by_customer from ps1_orders
	group by customer_number 
) tmp
where total_order_by_customer > 1


#Right Approach
select 
	customer_number 
from 
	(
	select customer_number,count(*) as total_order_by_customer from ps1_orders
	group by customer_number 
	order by total_order_by_customer desc
) tmp limit 1;



