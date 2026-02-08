#Question :
		
#Get the year salary for each & every employee  and if salary is null add 100 and return all the employee ?


select * from tmptable1;
select * from tmptable2;

/*

CREATE OR REPLACE TABLE temp1 (
  `empid` tinyint(4) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
)



CREATE TABLE temp2 (
  `id` tinyint(4) DEFAULT NULL,
  `empid` tinyint(4) DEFAULT NULL,
  `monthno` tinyint(4) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL
) 


INSERT INTO temp1 (empid, name) 
VALUES
(1, 'emp1'),
(2, 'emp2'),
(3, 'emp3');


INSERT INTO temp2 (id, empid, monthno, salary) 
VALUES
(1, 1, 1, 500),
(2, 1, 2, 1001),
(3, 1, 3, NULL),
(4, 1, 4, 500),
(5, 1, 5, 400),
(6, 1, 6, 700),
(7, 1, 7, NULL),
(8, 1, 8, 1000),
(9, 1, 9, 1000),
(10, 1, 10, 1000),
(11, 1, 11, 1000),
(12, 1, 12, 300),
(1, 2, 1, 1000),
(2, 2, 2, 1000),
(3, 2, 3, 1000),
(4, 2, 4, 1000),
(5, 2, 5, 1000),
(6, 2, 6, 200),
(7, 2, 7, 300),
(8, 2, 8, 1000),
(9, 2, 9, 400),
(10, 2, 10, NULL);


*/

/*
Output  

		1	10201
		2	9100
		3	100

*/

select
	t1.empid ,
	sum(t2.salary) as totalsum1 ,
	if (t2.salary is null , 100 , sum(t2.salary)) as totalsum2 ,
	sum(if (t2.salary is null , 100 , t2.salary)) as totalsum3
from 
	tmptable1 t1 left join tmptable2 t2 on t1.empid = t2.empid 
group by t1.empid
order by a.empid


