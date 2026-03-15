/*

Questions:

#Task : Take the average of balance


select *  from trans_table

*/





---------------------------------------------------

/*

See the difference Count (*) vs Count (1) vs Count (Coulmn name) In SQL

Note : This is aggregations functions it will same as rest of the functions

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




select 
	cid,
    month_name,
    avg(total_balance)
from 
	Temp
group by 
	cid

/*

Note :
Aggregate function will excllude the NULL values 
Here average is doing explict the NULL values 

For ex :

650 / 4 = 162.5
2300 / 12 = 191.1

*/