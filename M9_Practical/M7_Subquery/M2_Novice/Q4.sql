/*

Questions:
			Write a SQL query to find the total number of people present inside the hospital.



*/


CREATE or replace TABLE hospital (
    emp_id INT,
    action VARCHAR(10),
    time TIMESTAMP
);

INSERT INTO hospital (emp_id, action, time) VALUES
(1, 'in',  '2019-12-22 09:00:00'),
(1, 'out', '2019-12-22 09:15:00'),
(2, 'in',  '2019-12-22 09:00:00'),
(2, 'out', '2019-12-22 09:15:00'),
(2, 'in',  '2019-12-22 09:30:00'),
(3, 'out', '2019-12-22 09:00:00'),
(3, 'in',  '2019-12-22 09:15:00'),
(3, 'out', '2019-12-22 09:30:00'),
(3, 'in',  '2019-12-22 09:45:00'),
(4, 'in',  '2019-12-22 09:45:00'),
(5, 'out', '2019-12-22 09:40:00');

select * from hospital





/*
Sample Input :

| emp_id | action | time                |
| ------ | ------ | ------------------- |
| 1      | in     | 2019-12-22 09:00:00 |
| 1      | out    | 2019-12-22 09:15:00 |
| 2      | in     | 2019-12-22 09:00:00 |
| 2      | out    | 2019-12-22 09:15:00 |
| 2      | in     | 2019-12-22 09:30:00 |
| 3      | out    | 2019-12-22 09:00:00 |
| 3      | in     | 2019-12-22 09:15:00 |
| 3      | out    | 2019-12-22 09:30:00 |
| 3      | in     | 2019-12-22 09:45:00 |
| 4      | in     | 2019-12-22 09:45:00 |
| 5      | out    | 2019-12-22 09:40:00 |



Sample OP :

		2	2019-12-22 09:30:00.000		2019-12-22 09:15:00.000
		
		3	2019-12-22 09:45:00.000		2019-12-22 09:30:00.000
		
		4	2019-12-22 09:45:00.000	



*/




with cte as  
( select emp_id,
max(CASE when action = "in" then `time` END) as Intime,
max(CASE when action = "out" then `time` END) as Outtime
from hospital
group by emp_id )
select * from cte
where Intime > Outtime or Outtime is null
