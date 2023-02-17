/*
10) ntile( Buckets or range )
11) cume_dist()
*/

-- Ntile(Buckets or cluster)
-- Write q query to segregate  all the expensive phones , mid ranges phones and the cheaper phones

select 
	*,
	ntile(3) over (order by price desc ) as buckets 
from 
	Product


select 
	productname,
	case 
		when x.buckets = 1 then 'Expensive Phones'
		when x.buckets = 2 then 'Medium Phones'
		when x.buckets = 3 then 'Cheaper Phones' 
	end Phone_Category
from 
	(select *,ntile(3) over (order by price desc ) as buckets from Product) x;



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
