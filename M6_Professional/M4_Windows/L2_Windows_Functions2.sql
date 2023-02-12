/*
1) first_value()
2) second_value()
3) nth_value()
4) ntile(buckets)
5) cume_dist()
*/


select * from Product p 

-- First Value
-- Write Query to display the most expensive product under each category 

select 
*,
first_value(productname) over (partition by ProductCategory order by price desc ) as  most_exp_product
from Product

-- Last Value
-- Write Query to display the less expensive product under each category

select 
*,
first_value(productname) over (partition by ProductCategory order by price desc ) as  most_exp_product,
last_value(productname) over (partition by ProductCategory order by price desc) as  less_exp_product
from Product

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
from Product


-- Alternative way to write SQL query using Window functions

select *,
first_value(productname) over w as most_exp_product,
last_value(productname) over w as least_exp_product
from Product 
window w as (partition by ProductCategory order by price desc 
	range between unbounded preceding and unbounded following);


-- Nth Value
-- Write query to display the Second most expensive product under each category.



select *,
first_value(productname) over w as most_exp_product,
last_value(productname) over w as least_exp_product,
NTH_VALUE(productname,2) over w as second_most_exp_product
from Product 
where ProductCategory = 'Phone'
window w as (partition by ProductCategory order by price desc 
	range between unbounded preceding and unbounded following);


-- Ntile(Buckets)
-- Write q query to segregate  all the expensive phones , mid ranges phones and the cheaper phones

select *,ntile(3) over (order by price desc ) as buckets from Product

select productname,
case 
	when x.buckets = 1 then 'Expensive Phones'
	when x.buckets = 2 then 'Medium Phones'
	when x.buckets = 3 then 'Cheaper Phones' 
end Phone_Category
from ( select *,ntile(3) over (order by price desc ) as buckets from Product) x;



-- CUME_DIST(Cummalative distribution)
/*
Value --> 1 <-- CUME_DIST > 0 
Formuale = Current Row no (or Row No with value same as current row) / Total no of rows 
*/

-- Query to fetch all products which are constituing the first 30%
-- of the data in products table based on prices

SELECT
ProductCategory,
price,
ROW_NUMBER() OVER (ORDER BY price) row_num,
CUME_DIST() OVER (ORDER BY price) cume_dist_val
FROM
Product;



