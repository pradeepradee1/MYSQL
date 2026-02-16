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
a,b
from 
(select 
	*,
	 case 
	 	when a < b and b > a then CONCAT(cast(a as char),cast(b as char))
	 	when b < a and a > b then CONCAT(cast(b as char),cast(a as char))
	 	else "both equal"
	 end as logic
from 
	problemsolving1
) a
group by a.logic
having count(*) >= 1


#Approach3 ; Correlation Subquery

select 
*
from problemsolving1 p1
where not EXISTS 
(select * from problemsolving1 p2 
where p1.b = p2.a and p2.a = p1.b and p1.a > p2.a)

