select * from Product p 

-- First Value
-- Write Query to display the most expensive product under each category 

select *,
first_value(productname) over (partition by ProductCategory order by price desc ) as  most_exp_product
from Product

-- Last Value
-- Write Query to display the less expensive product under each category

select *,
first_value(productname) over (partition by ProductCategory order by price desc ) as  most_exp_product,
last_value(productname) over (partition by ProductCategory order by price desc) as  less_exp_product
from Product

#Note : This is wrong

-- Frame Clause

select *,
first_value(productname) 
	over (partition by ProductCategory order by price desc ) as  most_exp_product,
last_value(productname) 
	over (partition by ProductCategory order by price desc
	range between unbounded preceding and unbounded following
	) as  less_exp_product
from Product



select *,
first_value(productname) 
	over (partition by ProductCategory order by price desc ) as  most_exp_product,
last_value(productname) 
	over (partition by ProductCategory order by price desc
	rows between unbounded preceding and unbounded following
	) as  less_exp_product
from Product

-- Alternative way to write SQL query using Window functions

select *,
first_value(productname) over w as most_exp_product,
last_value(productname) over w as least_exp_product
from Product 
where ProductCategory = 'Phone'
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


-- Ntile
-- Write q query to segregate  all the expensive phones , mid ranges phones and the cheaper phones

select productname,
case 
	when x.buckets = 1 then 'Expensive Phones'
	when x.buckets = 1 then 'Expensive Phones'
	when x.buckets = 3 then 'Cheaper Phones' 
end Phone_Category
from ( select *,ntile(3) over (order by price desc ) as buckets from Product
	   where ProductCategory = "Phone") x;

	  
	  

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



-- PERCENT_RANK(relative rank of the current row / Perecntage Rankings)
/* Value --> 1 <= Percent_Rank >0 */
/* Formuala = Current Row No - 1 / Total No Of Rows -1 */

-- Query to identify how much percntage more expensive is "Galaxy Z Fold 3 " when compared to all product


SELECT
    ProductCategory,
    price,
    ROUND(
    PERCENT_RANK() OVER (PARTITION BY price ORDER BY price),2) percentile_rank
FROM
    Product;

