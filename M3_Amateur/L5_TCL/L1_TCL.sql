/*
TCL
*/

#DML Statement can be a rollback
#DDL Statement can’t be rollback	

/*
COMMIT :

		It is used to make permanent the user transactions(DML operations) on the table

		Note :
				Once a transaction made permanent then we cannot cancel it

*/

/*
ROLLBACK :
		
		It is used to cancel the user transaction.
*/


/*
SAVEPOINT :

		It is used to save a set of transactions under a name.
*/



use mydb;

select @@autocommit

set autocommit = 0


#Note:
#		Set Default = 0 or False
#       Without this set autocommit = 0 we can't rollback

#Eg 1
create or replace table cust
(
cid char(3),
cname varchar(20)
);


insert into cust 
values('c00','Sanju');

insert into cust 
values('c01','Manoj');


select * from cust;

commit;

update cust 
set cname="radee" 
where cid = 'c00'

update cust 
set cname="radee1" 
where cid = 'c01'

select * from cust c 

rollback;

select * from cust c
