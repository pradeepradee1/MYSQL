/*
REFERENTIAL INTEGRITY CONSTRAINTS :
									Used to implement PHYSICAL relationship between the tables by using primary key
									of one table and we can define foriegn key in other table.
									
									Foriegn key column contains only values from primary key. Foriegn key contains
									duplicates and null values also.

									--A table which contains primary key is considered as parent /Master/Base table.
									--A table which contains foriegn key is known as child table /Detailed table/ Derived
									table.


REFERENCES:
			we can use this keyword in the "creation of child table and to define foriegn key column".
			
			EX : create comp_dtls as parent table
			EX : create prod_dtls as child table
*/

create table comp_dtls
(
cmpId char(5) constraint pk_cmpid_comp_dtls primary key,
cmpName
varchar2(20) not null,
cmpCountry varchar2(20) not null,
constraint ck_country_cmp
check (cmpcountry IN('india','usa','japan','uk'))
);


insert into comp_dtls values('cmp01','sony','japan');
insert into comp_dtls values('cmp02','wipro','india') ;
insert into comp_dtls values('cmp03','Philips','india');
insert into comp_dtls values('cmp04','semantic','usa');


create table prod_DTLS
(
pid char(4) primary key,
pname varchar(20) not null,
cost number(7,2),
mfg date,
warrenty varchar(10),
cmpId char(5),
constraint fk_prod_cmpid FOREIGN KEY(cmpId) REFERENCES comp_dtls(cmpId)
/* foriegn key column */
)
;


insert into prod_dtls values
('p001','smart phone',34000,'12-may-14','1 year','cmp01');
insert into prod_dtls values
('p002','laptop',54000,'03-feb-14','3 years','cmp01');
insert into prod_dtls values
('p003','Television',24000,'08-aug-14','5 years','cmp03');
insert into prod_dtls values
('p004','Home Theatre',55000,'11-aug-13','2 years','cmp03');
insert into prod_dtls values
('p005','Mobile',24000,'08-aug-14','1 year',null);
insert into prod_dtls values
('p006','vmware',64000,'22-oct-10','1 year','cmp04');

#EX :
#create the following tables and Implement relationships accordingly?

1) Cust_dtls ( parent table)
cno	cname city gender mobile
|
Primary key

2) Act_types ( parent table)

Act_type 	act_name 		desc
SB			Savings Bank
DEMAT		Trading account
CA 			Current account

Primary key


3) cust_act_dtls (Child table)

Actno 	Act_type		Act_open_date	Act_bal		cno
PK    	Foreign key  								Foreign key


#sample examples:

create table student
(
rno number(2) primary key,
sname varchar2(10) not null,
course varchar2(15) not null,
fee number(5) not null,
mobile char(10) unique
);



insert into student values(1,'a','oracle',9000,1212);
insert into student values(11,'x','oracle',6000,1213);
insert into student values(0,null,'oracle',9000,1214);
insert into student values(0,'B','oracle',9000,1214);
insert into student values(10,'Ajay','orcl',9000,1215);
insert into student values(20,'A','xyz',99000,null);
insert into student values(13,'A','unix',19000,null);
insert into student values(23,'BAC','unix',0,null);



select * from student;


create table stud
(
rno number(3) constraint pk_rno_stud primary key,
sname varchar2(10) constraint nn_sname_stud not null,
course varchar2(15) constraint nn_course_stud not null,
fee number(5) constraint nn_fee_stud not null,
mobile char(10) constraint uk_mobile_stud unique,
constraint ck_rno_stud CHECK ( rno between 1 and 100),
constraint ck_course_stud CHECK( course in('oracle','unix')),
constraint ck_fee_stud CHECK(fee between 5000 and 20000)
);


insert into stud values(1,'a','oracle',9000,1212);
insert into stud values(11,'x','oracle',6000,1213);
insert into stud values(10,'C','oracle',9000,1214);
insert into stud values(20,'B','oracle',9000,1211);
insert into stud values(12,'Ajay','oracle',9000,1215);
insert into stud values(22,'A','unix',20000,null);
insert into stud values(13,'A','unix',19000,null);
insert into stud values(23,'BAC','unix',6000,null);

select * from stud;

alter table stud drop column course;
alter table stud drop column fee;

select * from stud;



create table course
(
cid varchar2(10) constraint pk_course_id primary key,
Name varchar2(20) constraint nn_name_course not null,
fee number (5) constraint nn_fee_course not null
)
;

insert into course values('C1','Oracle',13000);
insert into course values('C2','Unix',10000);
insert into course values('C3','Linux',10000);
insert into course values('C4','Sql Server',10000);

select * from course;
select * from stud;

alter table stud add course_id varchar2(20);

alter table stud add constraint fk_course_id_stud FOREIGN KEY(course_id)
REFERENCES course(cid);


update stud set course_id='C1'
where rno in(1,10,20,22,23);

update stud set course_id='C2' where course_id is null;
select * from stud;

select s.sname,s.mobile,c.name,c.fee from stud s , course c
where s.course_id=c.cid;



