#Question 2

/*
	Null Safe Join

	Table A 			Table B
		1 				  NULL					
		2  					2
		1 					5
		5 					5
	   NULL
	   NULL


	Output should be

		2          2
		5 		   5
		5          5
	   NULL       NULL
	   NULL       NULL
*/

create table problemsolving2_table1
(
colA tinyint
)

insert into problemsolving2_table1
values(1),(2),(1),(5),(Null),(Null)



create table problemsolving2_table2
(
colB tinyint
)

insert into problemsolving2_table2
values (Null),(2),(5),(5)

select * from problemsolving2_table1;
select * from problemsolving2_table2;


#Approach 1
select 
	*
from 
	problemsolving2_table1 pt1 
inner join problemsolving2_table2 pt2 on pt1.colA = pt2.colB or (pt1.colA is null and pt2.colB is null)

#Approach 2

select 
	*
from 
	problemsolving2_table1 pt1 
inner join problemsolving2_table2 pt2 on pt1.colA <=> pt2.colB 

#Note : <=> is Null Safe Operator

