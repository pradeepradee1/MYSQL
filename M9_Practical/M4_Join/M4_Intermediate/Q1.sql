/*
Questions: Remove The Duplicate Entry in mirror side


			1	2
			3	2
			2	4
			2	1
			5	6
			4	2


Output :

			1	2
			3	2
			2	4
			5	6



*/

CREATE or replace TABLE Temp (
    col1 INT,
    col2 INT
);


INSERT INTO Temp (col1, col2) 
VALUES
(1, 2),
(3, 2),
(2, 4),
(2, 1),
(5, 6),
(4, 2);



select * from Temp

#Approach1

select 
*
from 
Temp p1 
left join Temp p2
on p1.a = p2.b and  p1.b = p2.a

select 
p1.a,
p1.b
from 
problemsolving1 p1 
left join problemsolving1 p2
on p1.b = p2.a and p1.a = p2.b 
where p2.a is null or p1.a > p2.a

#OR
where p2.a is not null




#Approach2

select 
	least(col1,col2),greatest(col1,col2)
from 
	Temp a
group by least(col1,col2),greatest(col1,col2)
