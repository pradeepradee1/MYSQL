/*
TCL
*/

#Generally, DML operations on table data are considered as transactions

/*
COMMIT
*/

#It is used to make permanent the user transactions(DML operations) on the table

#Note :
#		Once a transaction made permanent then we cannot cancel it


/*
ROLLBACK
*/
#It is used to cancel the user transaction.

/*
SAVEPOINT
*/
#It is used to save a set of transactions under a name.



use mydb;


#Eg 1
create or replace table cust
(
cid char(3),
cname varchar(20)
);

insert into cust values('c00','Sanju');
insert into cust values('c01','Manoj');


select * from cust;

rollback;

select * from cust;

insert into cust values('c00','Sanju');
insert into cust values('c01','Manoj');
commit;

select * from cust;

rollback;

select * from cust;

#Eg 2

select * from cust;

Insert into cust values('c02','hellen');
select * from cust;
delete from cust where cname='Sanju';

select * from cust;

savepoint s1;
update cust set cname='aa' where cname='c02';
savepoint s2;


delete from cust;

select * from cust;

rollback to s2;

rollback;