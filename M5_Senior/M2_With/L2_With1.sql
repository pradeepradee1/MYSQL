-- Write a query to print the name of department along with the total salary paid in each department

-- Normal approach

select d.dept_name, tmp.total_salary
from (select dept_id , sum(salary) as total_salary from amazon_employees group by dept_id) tmp
inner join department d on tmp.dept_id = d.dept_id;


--- how to do it using with clause??


with dept_wise_salary as (select dept_id , sum(salary) as total_salary from amazon_employees group by dept_id);

with dept_wise_salary  as  (select dept_id , sum(salary) as total_salary from amazon_employees group by dept_id)
select d.dept_name, tmp.total_salary
from dept_wise_salary tmp
inner join department d on tmp.dept_id = d.dept_id;

#Note : we have to run along with select d.dept_name, tmp.total_salary from dept_wise_salary tmp

#Note : 1) After the run the with clause , we ll have temp table then temp table will be stored in internal memeory
#		2) It is not storing like the view (database object)

/*
Differences Between CTE and Views
		Views 	: if i excute Query many times as like computations will happen as many times Besacuse view is pointed to main table (it is like method or database object )
		CTE		: if i excute Query many times as like computations will happen as single times
*/

#recursive
--- Write a Query to generate numbers from 1 to 10 in SQL

with recursive generate_numbers as   
(
  select 1 as n -- Ancher Query (Starting Point)
  union 
  select n+1 from generate_numbers where n<10 -- generate_numbers is rescursice call 
) 
select * from generate_numbers;
