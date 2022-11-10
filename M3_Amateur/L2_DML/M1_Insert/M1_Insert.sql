/*
Basic INSERT
*/						


/*
	1) 	If number of columns and number of values are equal, 
		then no need to specify column names while inserting records.
	2) 	Char, Varchar and date type values should be enclosed in Single Quotes.
*/

use mydb;

#Insert Single Values
Insert into emp_info
values(111,'john',117,'23-05-14','developer','M');

Insert into emp_info
Values(112,'dilroop',61,'21-11-13','developer','F');

#This will be error
Insert into emp_info
Values('kiran','5000');

Insert into emp_info(eid,ename,sal,jdate,desg,gender)
values(111,'Dinesh',75,'23-04-14','developer','M');

#Insert Multiple Values
insert into emp_info(eid,ename,sal,jdate,desg,gender)
values
(112,'Ertiga',12,'2-04-20','developer','M'),
(113,'Ertiga1',22,'22-04-20','developer','F');




/*
Insert Null Values
	1) Implict
	2) Explict
*/
# 1) Implict
Insert into emp_info(eid,ename,sal,desg)
Values(55,'john',12,'salesman');

# 2) Explict 
Insert into emp_info
Values(8,'martin',12,null,null,null);




/*
    1) Default Keyword
*/
Insert into customer(cno,cname) 
values (1,'kiran');

Insert into customer(cno,cname) 
values (2,'Madhu');

Insert into customer 
values(3,'dinesh',Null);

Insert into customer 
values(4,'john','Texas');

Insert into customer(cname) 
values ('Radee');


/*
	2) 	AutoIncerement Keyword
*/

use mydb;

CREATE or REPLACE  TABLE iodku 
(
	id INT unsigned AUTO_INCREMENT,
	name VARCHAR(10),
	misc INT,
	PRIMARY KEY(id),
	UNIQUE(name)
) ENGINE=InnoDB;


#Auto_Increment
insert into iodku(id,name,misc)
values
(100,'Kite',75);

insert into iodku(name,misc)
values
('Kite123',75);




/* 
 	Unique Constraint (Igonre and Included)
*/


#Unique Constraint (Igonre)
TRUNCATE table iodku ;

insert ignore into iodku(id,name,misc)
values
(101,'Kite',96),
(102,'K',75),
(103,'Kite',95); 

#WithOut Ignore Keyword Error Will Come 
#because name columns has unique constraints
#(103,'Kite',95) will be ignored


#Unique Constraint (Included)
TRUNCATE table iodku 

INSERT INTO iodku (name, misc)
VALUES
('Leslie', 123),
('Sally', 456);


INSERT INTO iodku (name, misc)
VALUES
('Sally', 3333)
ON DUPLICATE KEY UPDATE
id = LAST_INSERT_ID(id),
misc = VALUES(misc);

SELECT LAST_INSERT_ID();


INSERT INTO iodku (name, misc)
VALUES
('Dana', 789);

SELECT LAST_INSERT_ID();

INSERT INTO iodku (name, misc)
VALUES
('Legar', 99);

SELECT LAST_INSERT_ID();
