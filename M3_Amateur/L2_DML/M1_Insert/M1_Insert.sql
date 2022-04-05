/*
1) Basic INSERT
*/						

/*
	1) 	If number of columns in the table and number of values inserting in to the table
		are equal, then no need to specify column names while inserting records.
	2) 	Char, Varchar2 and date type values should be enclosed in Single Quotes.
	3) 	If Number of inserting values are less than the number of columns then we must
		specify column names while inserting records.
*/

use mydb;

#Insert Single Values
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



#Insert Multiple Values
insert into 
emp_info(eid,ename,sal,jdate,desg,gender)
values
(112,'Ertiga',12,'2-04-20','developer','M'),
(113,'Ertiga1',22,'22-04-20','developer','F');


 

