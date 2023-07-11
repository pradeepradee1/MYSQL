
Create table If Not Exists my_numbers (num int);

insert into my_numbers (num) values ('8');
insert into my_numbers (num) values ('8');
insert into my_numbers (num) values ('3');
insert into my_numbers (num) values ('3');
insert into my_numbers (num) values ('1');
insert into my_numbers (num) values ('4');
insert into my_numbers (num) values ('5');
insert into my_numbers (num) values ('6');


select * from my_numbers


/*
Q : find biggest number which appers only once

OP:	
	num
	 6

*/

select 
	num 
from 
	my_numbers
group by 
	num 
having count(*) = 1
order by 
	num desc
limit 1;