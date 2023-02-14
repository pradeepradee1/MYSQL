#With Clause 
# To Avoid The Redundency Of Sub-Query
#Refers To CTE(Common Table Expression) and Sub Query Factoring

/*
Tow types
			1)	Iterative
			2)	Recursive

*/

select * from emp

-- Fetch the emp who earns more than avg salary of all employess

select
*
from emp e 
where e.sal >(select cast(avg(sal) as int) from emp)


with average_salary (avg_sal) as (select cast(avg(sal) as int) from emp)
select 
*
from 
emp e,average_salary av
where e.sal > av.avg_sal;


-- Find The Stores who's sales where better than the average sales accross all stores
select * from Sales s 

# 1) Total 	Sales per each store -- Total Sales
# 2) Find The average sales with respect all the stores. -- Avg_Sales
# 3) Find the stores where total sales  > avg sales of all stores

#1)

select 
s.Store_id ,sum(cost) as  total_sales_per_cost
from Sales s 
group by s.Store_id 


#2)
select 
avg(total_sales_per_store)
from (select s.Store_id,sum(cost) as total_sales_per_store from Sales s group by s.Store_id) x; 

#3)
select 
*
from 
(select s.Store_id,sum(s.cost) as total_sales_per_store from Sales s group by s.Store_id) total_sales

#Final


select 
*
from 
(select s.Store_id,sum(s.cost) as total_sales_per_store from Sales s group by s.Store_id) total_sales

join 

(select 
avg(total_sales_per_store) as total_sales_per_store
from (select s.Store_id,sum(cost) as total_sales_per_store from Sales s group by s.Store_id) x
) avg_sales

on total_sales.total_sales_per_store > avg_sales.total_sales_per_store


-- Here using more than subquery

with Total_Sales (Store_id,total_sales_per_store) as 
		(select s.Store_id ,sum(cost) as  total_sales_per_cost from Sales s group by s.Store_id ),
	 avg_sales(avg_sales_for_all_stores) as 
		(select avg(total_sales_per_store) as avg_sales_for_all_stores from Total_Sales)
select 
*
from Total_Sales ts 
join avg_sales av on ts.total_sales_per_store > av.avg_sales_for_all_stores

