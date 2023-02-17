#With Clause 


select 
	* 
from 
	emp

#Example : 1

-- Fetch the emp who earns more than avg salary of all employess

select
	*
from 
	emp e 
where 
	e.sal >(select cast(avg(sal) as int) from emp)


with average_salary (avg_sal) as (select cast(avg(sal) as int) from emp)
select 
	*
from 
	emp e,average_salary av
where 
	e.sal > av.avg_sal;

#Example : 2

-- Find The Stores who's sales where better than the average sales accross all stores
select * from Sales s 

# 1) Total 	Sales per each store -- Total Sales
# 2) Find The average sales with respect all the stores. -- Avg_Sales
# 3) Find the stores where total sales  > avg sales of all stores

#Step 1:
select 
	s.Store_id ,sum(cost) as  total_sales_per_cost
from 
	Sales s 
group by 
	s.Store_id 

#Step 2:
select 
	avg(x.total_sales_per_store)
from 
	(select s.Store_id,sum(cost) as total_sales_per_store from Sales s group by s.Store_id) x; 

#Step 3:
select 
	*
from 
	(select s.Store_id,sum(s.cost) as total_sales_per_store from Sales s group by s.Store_id) total_sales

#Fianl Step:

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

with Total_Sales (Store_id,total_sales_per_store) as (select s.Store_id ,sum(cost) as  total_sales_per_cost from Sales s group by s.Store_id ),
		 avg_sales(avg_sales_for_all_stores) as (select avg(total_sales_per_store) as avg_sales_for_all_stores from Total_Sales)
select 
	*
from 
	Total_Sales ts 
	join avg_sales av on ts.total_sales_per_store > av.avg_sales_for_all_stores




#Example :	3 


-- Write a query to print the name of department along with the total salary paid in each department

-- Normal approach

select 
  d.dept_name, tmp.total_salary
from 
  (select dept_id , sum(salary) as total_salary from amazon_employees group by dept_id) tmp
  inner join department d on tmp.dept_id = d.dept_id;


--- how to do it using with clause??

with dept_wise_salary  as  (select dept_id , sum(salary) as total_salary from amazon_employees group by dept_id)
select 
  d.dept_name, tmp.total_salary
from 
  dept_wise_salary tmp
  inner join department d on tmp.dept_id = d.dept_id;


#Note : we have to run the with clause along with select d.dept_name, tmp.total_salary from dept_wise_salary tmp

#Note:  1) After the run the with clause , we ll have temp table then temp table will be stored in internal memeory
#       2) It is not storing like the view (database object)

