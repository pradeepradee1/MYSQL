/*

Q : Biggest Single Number
	find biggest number which appers only once?

OP:	
	num
	 6

*/






create or replace table  Temp (num int);

insert into Temp (num) values ('8');
insert into Temp (num) values ('8');
insert into Temp (num) values ('3');
insert into Temp (num) values ('3');
insert into Temp (num) values ('1');
insert into Temp (num) values ('4');
insert into Temp (num) values ('5');
insert into Temp (num) values ('6');


select * from Temp



select 
	num 
from 
	Temp
group by 
	num 
having count(*) = 1
order by 
	num desc
limit 1;