//*
Question2:

			1	2
			3	2
			2	4
			2	1
			5	6
			4	2

Remove The Duplicate Entry in mirror side

Output should be like 

			1	2
			3	2
			2	4
			5	6



*/


select * from problemsolving1





#Approach1

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

#Approach2

select 
*
from 
problemsolving1 p1 
left join problemsolving1 p2
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

#Approach3 ; Correlation Subquery

select 
*
from problemsolving1 p1
where not EXISTS 
(select * from problemsolving1 p2 
where p1.b = p2.a and p2.a = p1.b and p1.a > p2.a)

