#Question 3

#Calculate the date wise rolling average of amazon sales

/*
What is rolling Average ?

adding the return quantities in January, February, and March, and then dividing that sum by three.
adding the return quantities in January, February,March,April and then dividing that sum by four.


*/

select *,
       avg(sales_amount) over(order by sales_data) as rolling_avg
from amazon_sales_data;


/*
Moving average is of two types

1. Simple moving average 

2. Exponential moving average


*/



# Query - get one employee from each department who is getting maximum salary (employee can be random if salary is same)

# Query - get one employee from each department who is getting maximum salary (employee can be random if salary is same)

# Query - get all employees from each department who are getting maximum salary

# Query - get all top 2 ranked employees from each department who are getting maximum salary

# Query - Calculate the differnce of sales with previous day sales




#Questions:
#calculate the rolling sum for a week


select *,
       sum(sales_amount) over(order by sales_date range between interval '6' day preceding and current row) as running_weekly_sum
from daily_sales;
