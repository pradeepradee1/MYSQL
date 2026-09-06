/*

Questions:

# Real time in CUB

#Task : Take average of balance that only the active cusotmer of contributed in every month of year

select *  from Temp 

*/



-----------------------------------------------------


/*

See the difference Count (*) vs Count (1) vs Count (Coulmn name) In SQL

Note : 
        Group function will treat the multiple null values as equals
        Aggregate function will exclude the null values  

*/


/*

Note : Important
Group By handle the Null values
Aggragation function wlll not hadle the NULL values

*/


CREATE or replace TABLE Temp (
    cid     INT,
    month_name   INT,
    total_balance     INT
);


INSERT INTO Temp (cid, month_name, total_balance) VALUES
(1, 1, 150),
(1, 2, 150),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL),
(1, 6, NULL),
(1, 7, NULL),
(1, 8, NULL),
(1, 9, NULL),
(1, 10, NULL),
(1, 11, 200),
(1, 12, 150),
(2, 1, 200),
(2, 2, 200),
(2, 3, 200),
(2, 4, 200),
(2, 5, 200),
(2, 6, 200),
(2, 7, 200),
(2, 8, 200),
(2, 9, 200),
(2, 10, 200),
(2, 11, 150),
(2, 12, 150);


#Note : This will include the null values

select 
cid,
month_name,
sum(total_balance) as total_year_sum_balance
from Temp
-- where total_balance is not null
group by cid
having count(*) = 12




select 
cid,
month_name,
sum(total_balance) as total_year_sum_balance
from 
Temp
where total_balance is not null
group by cid
having count(*) = 12


