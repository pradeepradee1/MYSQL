create or replace table Temp  (Id int, Email varchar(255));
insert into Temp (Id, Email) values ('1', 'john@example.com');
insert into Temp (Id, Email) values ('2', 'bob@example.com');
insert into Temp (Id, Email) values ('3', 'john@example.com');

/*

Find the Duplicate email id

*/


select * from Temp 




select 
	* 
from 
	Temp 
group by Email 
having count(*) > 1



/*

Q:	Delete duplicate email entries based on its largest id

OP : 
		1	john@example.com
		2	bob@example.com
		


*/
select * from Temp


delete from Temp 
where (Email,Id) in 
(select Email,max(Id) from Temp group by Email having count(*) > 1)


select * from Temp

