/*

Exists give bool function 
It Will be used in Subquery(Correlation Subquery)
*/


create table customers ( customer_id int, customer_name varchar(100), customer_email varchar(200), primary key (customer_id) );

insert into customers values(1,'Shashank','abc@gmail.com');
insert into customers values(2,'Rahul','aaa@gmail.com');
insert into customers values(3,'Ajay','klm@gmail.com');
insert into customers values(4,'Nitin','poc@gmail.com');
insert into customers values(5,'Naveen','mnc@gmail.com');

create table orders ( order_id int, customer_id int, amount float, status varchar(50), primary key (order_id) );

insert into orders values(101,1,550,'Delivered');
insert into orders values(102,2,350,'Delivered');
insert into orders values(103,1,220,'Cancelled');
insert into orders values(104,3,660,'Delivered');
insert into orders values(105,3,300,'Delivered');


select 
c.*
from 
customers c 
left join orders o on c.customer_id  = o.order_id 
where o.customer_id is not null and c.customer_name = 'Shashank' ;



select 
c.*
from 
customers c 
where EXISTS 
(select order_id from orders o where c.customer_id  = o.order_id and c.customer_name = 'Shashank') ;
