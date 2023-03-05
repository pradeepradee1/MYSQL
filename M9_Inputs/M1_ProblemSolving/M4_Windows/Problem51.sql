#Question 3

#Calculate the date wise rolling average of amazon sales


select 
       *,
       avg(sales_amount) over(order by sales_data) as rolling_avg
from 
       amazon_sales_data;


/*

adding the return quantities in January, February, and March, and then dividing that sum by three.
adding the return quantities in January, February,March,April and then dividing that sum by four.


*/


/*

Calculate the date wise 5 day rolling average  of amazon sales

What is rolling Average ?
       
       It is also know as moving averages 

       Find the 3 day moving average 

       for ex : [61,63,66,67,68,71,72]
       
     Averages     moving_avg_3_day
       61            - 
       63            -
       66            63
       67            65
       68            67
       71            69
       72            70


*/

#Question 4 : 


#Calculate the month wise of quarter rolling average of amazon sales


select 
       *,
       sum(salary) over(partition by empid  order by monthno 
       range between  3 PRECEDING  and 0 FOLLOWING  ) as running_total_salary
from 
       tmptable2



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


select 
       *,
       sum(sales_amount) over(order by sales_date range between interval '6' day preceding and current row) as running_weekly_sum
from 
       daily_sales;
