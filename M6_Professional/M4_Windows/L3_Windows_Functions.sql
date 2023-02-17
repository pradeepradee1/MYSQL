/*
7) first_value()
8) second_value()
9) nth_value()
*/


select * from Product p 

-- First Value
-- Write Query to display the most expensive product under each category 

select 
	*,
	first_value(productname) over (partition by ProductCategory order by price desc ) as  most_exp_product
from 
	Product

-- Last Value
-- Write Query to display the less expensive product under each category

select 
	*,
	first_value(productname) over (partition by ProductCategory order by price desc ) as  most_exp_product,
	last_value(productname) over (partition by ProductCategory order by price desc) as  less_exp_product
from 
	Product

#Note : This is wrong

/*
Frame Clause
	
	1)	Rows Between (define upper bound and lower bound of row to be covered)
	2)	Range Between  (define upper and lower range of value for a column to be covered)
			


							partition 
						|-----------------------|
						|						|						 
		N Preceding		|	______________      |   Unbounded preceding  
						|						|
						|						|
		current row 	|_______________________|  
 						|						|
						|						|
						|						|
		M following		|	______________      |  Unbounded following
						|						|
						|						|
						|-----------------------|


		Where N,M are Number Of Rows


*/




select 
	*,
	first_value(productname) over (partition by ProductCategory order by price desc ) as  most_exp_product,
	last_value(productname) over (partition by ProductCategory order by price desc 
	range between unbounded preceding and unbounded following) as  less_exp_product
from 
	Product


-- Alternative way to write SQL query using Window functions

select *,
	first_value(productname) over w as most_exp_product,
	last_value(productname) over w as least_exp_product
from 
	Product 
	window w as (partition by ProductCategory order by price desc 
	range between unbounded preceding and unbounded following);


-- Nth Value
-- Write query to display the Second most expensive product under each category.



select 
	*,
	first_value(productname) over w as most_exp_product,
	last_value(productname) over w as least_exp_product,
	NTH_VALUE(productname,2) over w as second_most_exp_product
from 
	Product 
where 
	ProductCategory = 'Phone'
	window w as (partition by ProductCategory order by price desc 
	range between unbounded preceding and unbounded following);





