/*
Views :
		1) Simple and Updateable View

*/

use mydb;

create view sales_informations as
select 
* 
from dept 
where dname ='Sales';

select 
* 
from sales_informations;

create view finance_informations as
select 
e.*
from emp e inner join dept d on e.dno = d.dno 
where d.dname = 'Finance';

select 
* 
from finance_informations;

select 
ename , sal 
from finance_informations;

#--SUB TABLES MAINTAINS DATA STATICALLY
#--VIEWS MAINTAINS DATA DYNAMICALLY.

create or replace table emp_mgr as 
select 
* 
from emp 
where dno=30;

select 
*
from emp_mgr

create or replace view emp_mgr_info as 
select * 
from emp 
where dno=30;

select 
*
from 
emp_mgr_info

insert into emp 
values
(10,'V',5000,30),
(11,'VV',5000,30);

select 
* 
from
emp_mgr

select 
*
from 
emp_mgr_info

delete from emp_mgr_info
where ename = 'VV'

select 
*
from emp_mgr

select 
*
from 
emp_mgr_info

select 
*
from emp
where 
dno = 30
