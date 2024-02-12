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

	