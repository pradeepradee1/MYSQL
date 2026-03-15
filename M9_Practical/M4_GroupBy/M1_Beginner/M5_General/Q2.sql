/*

Questions : 
			Get Customer id from customer table that bought all the product in the product table

For Ex   :
			1 and 3 bought all the prodycts
			2 bought only the one products			
*/




Create or replace table Temp1 (customer_id int, product_key int);
Create or replace table Temp2 (product_key int);

insert into Temp1 (customer_id, product_key) values ('1', '5');
insert into Temp1 (customer_id, product_key) values ('2', '6');
insert into Temp1 (customer_id, product_key) values ('3', '5');
insert into Temp1 (customer_id, product_key) values ('3', '6');
insert into Temp1 (customer_id, product_key) values ('1', '6');

insert into Temp2 (product_key) values ('5');
insert into Temp2 (product_key) values ('6');

select * from Temp1
select * from Temp2



#Static defined
select 
	pc.customer_id
from 
	psProduct ps
inner join psCustomer pc on ps.product_key = pc.product_key 
group by pc.customer_id 
having count(distinct ps.product_key) >= 2

#Right Approach
SELECT 
	*
from 
	psCustomer pc 
group by pc.customer_id 
having count(*) = (select count (DISTINCT product_key) from psProduct) 


#Right Approach
SELECT 
	customer_id 
from 
	psCustomer
group by  customer_id 
having count(DISTINCT product_key) = (select count(*) from psProduct pp)
