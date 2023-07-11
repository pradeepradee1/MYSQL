create or replace table pPerson (Id int, Email varchar(255));
insert into pPerson (Id, Email) values ('1', 'john@example.com');
insert into pPerson (Id, Email) values ('2', 'bob@example.com');
insert into pPerson (Id, Email) values ('3', 'john@example.com');

/*

Q:	Delete duplicate entries based on its smallest id

OP : 
		2	bob@example.com
		1	john@example.com


*/


delete from pPerson
where Id not in (select min(Id) from pPerson group by Email)

select * from pPerson
