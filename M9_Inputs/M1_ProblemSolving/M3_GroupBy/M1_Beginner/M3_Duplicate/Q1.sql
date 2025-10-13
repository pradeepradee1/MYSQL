create or replace table pPerson (Id int, Email varchar(255));
insert into pPerson (Id, Email) values ('1', 'john@example.com');
insert into pPerson (Id, Email) values ('2', 'bob@example.com');
insert into pPerson (Id, Email) values ('3', 'john@example.com');

/*

Find the Duplicate records

*/


select * from pPerson 




select 
	* 
from 
	pPerson 
group by Email 
having count(*) > 1



/*

Q:	Delete duplicate email entries based on its largest id

OP : 
		1	john@example.com
		2	bob@example.com
		


*/
select * from pPerson


delete from pPerson
where Id not in (select min(Id) from pPerson group by Email)

select * from pPerson

