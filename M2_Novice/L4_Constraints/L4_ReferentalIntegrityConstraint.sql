/*
REFERENTIAL INTEGRITY CONSTRAINTS :
									Used to implement PHYSICAL relationship between the tables by using primary key
									of one table and we can define foriegn key in other table.
									
									Foriegn key contains duplicates and null values also.

									--A table which contains primary key is considered as parent/Master/Base table.
									--A table which contains foriegn key is known as child/Detailed/Derived table.


REFERENCES:
			we can use this keyword in the "creation of child table and to define foriegn key column".
			
			EX : create comp_dtls as parent table
			EX : create prod_dtls as child table
*/
use mydb;



create or replace table comp_dtls
(
cmpId char(5),
cmpName varchar(20) not null,
cmpCountry varchar(20) not null,
constraint pk primary key (cmpId),
constraint ck_country_cmp check (cmpCountry IN('india','usa','japan','uk'))
);


insert into comp_dtls values('cmp01','sony','japan');
insert into comp_dtls values('cmp02','wipro','india') ;
insert into comp_dtls values('cmp03','Philips','india');
insert into comp_dtls values('cmp04','semantic','usa');



create or replace table prod_DTLS
(
pid char(4),
pname varchar(20) not null,
cost float(7,2),
mfg date,
warrenty varchar(10),
cmpId char(5),
constraint pk primary key(pid),
constraint fk FOREIGN KEY(cmpId) REFERENCES comp_dtls(cmpId)
/* foriegn key column */
)
;

#Note : FK creates relationship with another PK(cmpID)



insert into prod_DTLS values
('p001','smart phone',34000,'12-01-14','1 year','cmp01');
insert into prod_DTLS values
('p002','laptop',54000,'03-01-14','3 years','cmp01');
insert into prod_DTLS values
('p003','Television',24000,'08-08-14','5 years','cmp03');
insert into prod_DTLS values
('p004','Home Theatre',55000,'11-08-13','2 years','cmp03');
insert into prod_DTLS values
('p005','Mobile',24000,'08-08-14','1 year',null);
insert into prod_DTLS values
('p006','vmware',64000,'22-10-10','1 year','cmp04');



DESC comp_dtls
DESC prod_DTLS

USE INFORMATION_SCHEMA;

SELECT *
FROM KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = "mydb" AND TABLE_NAME = "comp_dtls" 

SELECT *
FROM KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = "mydb" AND TABLE_NAME = "prod_DTLS" 

(OR)

SHOW COLUMNS FROM prod_DTLS;

(OR)

DESC student_dtls'