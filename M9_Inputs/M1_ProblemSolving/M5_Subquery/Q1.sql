Create table  psEmployee (Id int, Salary int);

insert into psEmployee (Id, Salary) values ('1', '100');
insert into psEmployee (Id, Salary) values ('2', '200');
insert into psEmployee (Id, Salary) values ('3', '300');

select * from psEmployee

#Get Second Max Salary
/*
		SecondMaxSalary
			200

*/

select 
	* 
from 
	psEmployee
where id = (select id from psEmployee pe order by Salary desc limit 1,1 )



select 
	max(Salary) as secondMaxSalary
from 
	psEmployee pe 
where Salary not in (select max(Salary) from psEmployee pe2 )
