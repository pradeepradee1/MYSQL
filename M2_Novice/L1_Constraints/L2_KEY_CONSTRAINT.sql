/*
KEY CONSTRAINT :
			These constraints check the individual values in to a column according to Business.

1) UNIQUE :
			It doesn’t allow duplicates but allows null values.
			Ex: This constraint is suitable for maintaining phone numbers, mailid, etc...
			
2) NOT NULL :
			It doesn’t allow null values but allows duplicates.
			Ex: EmpNames, CustNames, .....

3) PRIMARY KEY :
			It doesnt allow duplicates and null values.
			Generally a Primary key is used to identify any record in a table uniquely.
			Only one primary key is allowed per a table
			
			PRIMARY KEY has two types :
				1)Simple :
						If a Primary key Defined on a single column then it is known as Simple Primary key.
				2)Composite :
						If a Primary key constraint defined on more than one column then it is known 
						as Composite Primary Key.
			
			NOTE :
			(Max numbers of columns in to a composite Primary key are 32 columns)
			Composite Primary Key: primary key (custid,prodid,timeid)
			
*/


#SYNTAX :

Create table <table name>
(
col1 data type(size) <constraint_name>,
col2 data type(size) <constraint_name>,
:
:
:
:
);

#EX:
#create a table student with columns rno,sname,course,fee and 
#mobile along with constraints pk,nn,nn,nn and unique respectively?

Create or Replace table student
(
rno int(2) PRIMARY KEY ,
sname varchar(10) not null,
course varchar(15) not null,
fee int(5) not null,
mobile char(10) unique
)
;

insert into student values(1,'a','oracle',9000,'8989898989');
insert into student values(0,'b','java',2000,'8787878787');
insert into student values(2,'x','oracle',9000,null);
insert into student values(11,'s','abc',100,null);

SELECT * from student;

#ERROR GENERATING RECORDS:

insert into student values(1,'kiran','java',2300,null);
insert into student values(null,'kiran','java',2300,null);
insert into student values(12,null,'java',2300,null);
insert into student values(1,'kiran',null,2300,null);
insert into student values(1,'kiran','java',null,null);
insert into student values(1,'kiran','java',2300,8989898989);


#Note: Even after the key constraints on the table, still we have invalid values.
	   # We can eliminate them by using DOMAIN constraints.


/*
Displaying constraints information on a table:

In oracle database, all constraints stored in a system defined table called USER_CONSTRAINTS.
Each constraint named and numbered uniquely like, SYS_Cn(System defined Constraint).
To Fetch data from this table use the below example.

*/
#EX:
select constraint_name,constraint_type from USER_CONSTRAINTS 
where table_name='STUDENT';


#CONSTRAINTS with user-defined names:
/*
#SYNTAX:

<col> datatype(size) Constraint <User defined name><actual constraint name>,
<col> datatype(size) Constraint <User defined name><actual constraint name>

#EX:
<col> datatype(size) Constraint pk_rno_student Primary key,
*/ 
create table stud_dtls
(
rno int(2) constraint pk_rno_stud primary key ) :
sname int (20) constraint nn_sname_stud not null,
course int (7) constraint nn_course_stud not null,
fee int (5) constraint nn_fee_stud not null,
mobile int (10) constraint uk_mobile_stud unique
);


create table student_dtls
(
rno number(2) constraint pk_rno_student primary key,
constraint ck_rno_student check (rno between 1 and 60),
sname varchar2(20) constraint nn_sname_student not null,
course varchar2(7) constraint nn_course_student not null,
constraint ck_course_student check (course In('cse','ece','eee','it')),
fee number(5) constraint nn_fee_student not null,
constraint ck_fee_student check (fee between 30000 and 40000),
mobile number(10) constraint uk_mobile_student unique
);



select constraint_name,constraint_type from user_constraints where
table_name='STUDENT_DTLS';



