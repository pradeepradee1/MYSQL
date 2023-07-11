create table ps_customers ( customer_id int, customer_name varchar(100), customer_email varchar(200), primary key (customer_id) );

insert into ps_customers values(1,'Shashank','abc@gmail.com');
insert into ps_customers values(2,'Rahul','aaa@gmail.com');
insert into ps_customers values(3,'Ajay','klm@gmail.com');
insert into ps_customers values(4,'Nitin','poc@gmail.com');
insert into ps_customers values(5,'Naveen','mnc@gmail.com');

create table ps_orders ( order_id int, customer_id int, amount float, status varchar(50), primary key (order_id) );

insert into ps_orders values(101,1,550,'Delivered');
insert into ps_orders values(102,2,350,'Delivered');
insert into ps_orders values(103,1,220,'Cancelled');
insert into ps_orders values(104,3,660,'Delivered');
insert into ps_orders values(105,3,300,'Delivered');



SELECT * from ps_customers

SELECT * from ps_orders

SELECT 
	a.* 
from 
	ps_customers a
	left join ps_orders b on a.customer_id = b.customer_id 
where 
	b.customer_id is not NULL  and a.customer_name = "Shashank"


SELECT 
	a.* 
from 
	ps_customers a
where 
	EXISTS (select * from ps_orders b where a.customer_id = b.customer_id and a.customer_name = "Shashank" )

	