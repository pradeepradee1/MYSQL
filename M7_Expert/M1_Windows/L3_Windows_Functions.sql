/*
7) first_value()
8) last_value()
9) nth_value()
*/


select * from Product p 


/*

CREATE TABLE Product (
    ProductCategory VARCHAR(50),
    Brand VARCHAR(50),
    productname VARCHAR(100),
    price INT
);

INSERT INTO Product (ProductCategory, Brand, productname, price) VALUES
('Phone', 'Apple', 'iphone', 1300),
('Phone', 'Apple', 'iphone12pro', 1100),
('Phone', 'Apple', 'iphone12', 1000),
('Phone', 'Samsung', 'Galaxy1', 1800),
('Phone', 'Samsung', 'Galaxyfold', 1000),
('Phone', 'Samsung', 'Galaxy12', 1200),
('Phone', 'Samsung', 'Galaxy3', 1000),
('Phone', 'Oneplus', 'OneplusNord', 300),
('Phone', 'Oneplus', 'Oneplus9', 800),
('Phone', 'Google', 'Pixel5', 600),
('Laptop', 'Apple', 'Pixel5', 600),
('Phone', 'Google', 'MacBookPro13', 2000),
('Laptop', 'Apple', 'iphone', 1300),
('Laptop', 'Micrsoft', 'man', 2100),
('Laptop', 'Dell', 'xps12', 2000),
('Laptop', 'Dell', 'xps13', 2300),
('Earphone', 'Samsung', 'buds32', 200),
('Earphone', 'Aple', 'buds123', 300),
('Earphone', 'Samsung', 'airduds', 200),
('Headphone', 'Sony', 'WFX123', 200),
('Headphone', 'Aple', 'WFX12', 300),
('Headphone', 'Samsung', 'samhead123', 200);

*/

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
	rows between unbounded preceding and unbounded following) as  less_exp_product
from 
	Product


-- Alternative way to write SQL query using Window functions

select *,
	first_value(productname) over w as most_exp_product,
	last_value(productname) over w as least_exp_product
from 
	Product 
	window w as (partition by ProductCategory order by price desc 
	rows between unbounded preceding and unbounded following);


-- Nth Value
-- Write query to display the Second most expensive product under each category.



select 
	*,
	first_value(productname) over w as most_exp_product,
	last_value(productname) over w as least_exp_product,
	NTH_VALUE(productname,2) over w as second_most_exp_product
from 
	Product 
	window w as (partition by ProductCategory order by price desc 
	rows between unbounded preceding and unbounded following);




