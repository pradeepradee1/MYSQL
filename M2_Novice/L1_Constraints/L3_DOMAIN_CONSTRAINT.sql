/*
DOMAIN constraints:
					It is used to define a valid range / valid list of values on a column by using the keyword
					CHECK
					
					CHECK Has two operators
						1) BETWEEN : 
								to define range
						2) IN :
								to define list of values.
					
*/

#Ex 1: create the above table along with below domain constraints:

# rno should be between 1 and 60
# course names are oracle, sql server and unix
# Min fee is 5000 and max fee 10000

create table stud_dtls
(
rno int(2) constraint pk_rno_stud primary key,
sname varchar(10) constraint nn_name_stud not null,
course varchar(15) constraint nn_course_stud not null,
fee int(5) constraint nn_fee_stud not null,
mobile char(10) constraint uk_mobile_stud unique,
constraint ck_rno_stud check (rno between 1 and 60),
constraint ck_course_stud check (course in('oracle','sql server','unix')),
constraint ck_fee_stud check (fee between 5000 and 10000)
);


insert into stud_dtls values(1,'a','oracle',7000,1212);
insert into stud_dtls values(0,'b','sql server',7000,null);
insert into stud_dtls values(61,'a','oracle',7000,null);
insert into stud_dtls values(12,'b','sql server',7000,null);
insert into stud_dtls values(11,'ajay','unics',10000,2212);
insert into stud_dtls values(21,'hari','unix',17000,1211);
insert into stud_dtls values(21,'hari','unix',11000,1211);



#EX 2 : CREATING A TABLE WITH USER-FRIENDLY NAMES TO THE CONSTRAINTS

create table s_dtls
(
rno number(2) CONSTRAINT PK_RNO_S_DTLS primary key,
sname varchar2(10) CONSTRAINT NN_SNAME_S_DTLS not null,
course varchar2(15) CONSTRAINT NN_COURSE_S_DTLS not null,
fee number(5) CONSTRAINT NN_FEE_S_DTLS not null,
mobile char(10) CONSTRAINT UK_MOB_S_DTLS unique,
CONSTRAINT CK_RNO_S_DTLS check (rno between 1 and 60),
CONSTRAINT CK_COURSE_S_DTLS check (course in('oracle','sql server','unix')),
CONSTRAINT CK_FEE_S_DTLS check (fee between 10000 and 20000)
);

# How do i display constraints information of a table?


SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE FROM USER_CONSTRAINTS
WHERE TABLE_NAME='s_dtls'; #----> this won't work

SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE FROM USER_CONSTRAINTS
WHERE TABLE_NAME='S_DTLS';


