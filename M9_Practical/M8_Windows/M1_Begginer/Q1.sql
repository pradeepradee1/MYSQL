/*
#Question 1:

#Calculate the date wise rolling average of amazon sales

*/

CREATE or replace TABLE amazon_sales_data (
    sales_date DATE,
    sales_amount INT
);

INSERT INTO amazon_sales_data (sales_date, sales_amount) VALUES
('2022-08-21', 500),
('2022-08-22', 600),
('2022-08-19', 300),
('2022-08-18', 200),
('2022-08-25', 800);


SELECT 
       *,
       AVG(sales_amount) OVER(ORDER BY sales_date) AS rolling_avg
FROM 
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

/*
#Question 2 : 


#Calculate the month wise of quarter rolling average of amazon sales

*/

CREATE or replace TABLE tmptable2 (
    empid INT,
    monthno INT,
    salary INT
);


INSERT INTO tmptable2 (empid, monthno, salary) VALUES
(101, 1, 1000),
(101, 2, 1200),
(101, 3, 1100),
(101, 4, 1500),
(101, 5, 1700),
(101, 6, 1600),
(102, 1, 900),
(102, 2, 1000),
(102, 3, 1200),
(102, 4, 1300),
(102, 5, 1400),
(102, 6, 1500);


select 
       *,
       avg(salary) over w as avg_sal
from 
       tmptable2
window w as (partition by empid order by monthno range between 3 PRECEDING and 0 FOLLOWING) 





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
