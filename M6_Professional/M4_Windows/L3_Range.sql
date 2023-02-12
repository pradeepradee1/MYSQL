/*
Frame Clause
	
	1)	Rows Between (define upper bound and lower bound of row to be covered)
	2)	Range Between  (define upper and lower range of value for a column to be covered)
			


							partition 
						|-----------------------|
						|    			   |						 
			N Preceding		|	______________   |   Unbounded preceding  
						|     			   |
						|			   |
		current row 			|_______________________|  
 						|			   |
						|			   |
						|			   |
			M following		|	______________   |  Unbounded following
						|			   |
						|			   |
						|-----------------------|


		Where N,M are Number Of Rows


*/

select 
*,
sum(price) over(order by price rows between 1 preceding and 1 following) as prev_plus_next
from Product

select 
*,
sum(price) over(order by price rows between 2 preceding and 1 following) as prev_plus_next
from Product

select 
*,
sum(price) over(order by price rows between 1 preceding and current row) as prev_plus_next
from Product

select 
*,
sum(price) over(order by price rows between current row and 1 following) as prev_plus_next
from Product

#Unbounded = include all
select 
*,
sum(price) over(order by price rows between unbounded preceding and current row) as prev_plus_next
from Product

select 
*,
sum(price) over(order by price rows between unbounded preceding and unbounded following) as prev_plus_next
from Product

#Range 

select 
*,
sum(price) over(order by price range between 100 preceding and 200 following) as prev_plus_next
from Product

#Here look in price 200 diff with 2nd row with 200 (200-200)=0 , So it include with range between 100 and 200 



#Questions:
#calculate the rolling sum for a week


select *,
       sum(sales_amount) over(order by sales_date range between interval '6' day preceding and current row) as running_weekly_sum
from daily_sales;
