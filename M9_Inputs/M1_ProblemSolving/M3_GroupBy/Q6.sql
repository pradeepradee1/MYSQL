Create table psCustomer (customer_id int, product_key int);
Create table psProduct (product_key int);

insert into psCustomer (customer_id, product_key) values ('1', '5');
insert into psCustomer (customer_id, product_key) values ('2', '6');
insert into psCustomer (customer_id, product_key) values ('3', '5');
insert into psCustomer (customer_id, product_key) values ('3', '6');
insert into psCustomer (customer_id, product_key) values ('1', '6');

insert into psProduct (product_key) values ('5');
insert into psProduct (product_key) values ('6');

select * from psProduct
select * from psCustomer



select 
	pc.customer_id
from 
	psProduct ps
inner join psCustomer pc on ps.product_key = pc.product_key 
group by pc.customer_id 
having count(distinct ps.product_key) >= 2


SELECT 
	customer_id 
from 
	psCustomer
group by  customer_id 
having count(DISTINCT product_key) = (select count(*) from psProduct pp)
