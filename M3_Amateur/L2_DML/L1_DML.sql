/*
DML
*/

/*
1) INSERT
*/						

/*
	1) 	If number of columns in the table and number of values inserting in to the table
		are equal, then no need to specify column names while inserting records.
	2) 	Char, Varchar2 and date type values should be enclosed in Single Quotes.
	3) 	If Number of inserting values are less than the number of columns then we must
		specify column names while inserting records.
*/

use mydb;


insert into 
emp_info(eid,ename,sal,jdate,desg,gender)
values(111,'Dinesh',75,'23-04-14','developer','M');

insert into 
emp_info
values(111,'john',117,'23-05-14','developer','M');

insert into 
emp_info
Values(112,'dilroop',61,'21-11-13','developer','F');

#This will be error
Insert into 
emp_info
Values('kiran','5000');


/*
Insert Null Values
	1) Implict
	2) Explict
*/
# 1) Implict
Insert into 
emp_info(eid,ename,sal,desg)
Values(55,'john',12,'salesman');

# 2) Explict 
Insert into 
emp_info
Values(8,'martin',12,null,null,null);



/*
# Default Keyword
*/
Insert into 
customer(cno,cname) 
values (1,'kiran');



Insert into 
customer(cno,cname) 
values (2,'Madhu');

Insert into 
customer 
values(3,'dinesh',Null);

Insert into 
customer 
values(4,'john','Texas');



/*
Update
*/

select * FROM  emp_info

update emp_info 
set sal = 100 
where eid = 8

#Update all sal as 100

update emp_info 
set sal = 100


# update the salesman salary with 20% increment , change their designition as
# Sr.SALES who joined before 2005?

update emp_info 
set sal = sal+(0.20*sal),desg='Senior Developer' 
where eid=112



/*
Delete
*/

delete from emp_info 

delete from emp_info 
where desg IS NULL 

#Note:
#We can get the back the deleted records / data within the current session by using
#ROLLBACK.





