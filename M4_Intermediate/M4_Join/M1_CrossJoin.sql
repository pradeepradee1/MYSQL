/*
	Cross Join : Return All The Records from Both Tables
*/

# Cross Join
use mydb;

#1)
select
eid,ename,sal,dname 
from 
emp cross join dept;

#2)
select
eid,ename,sal,dname 
from 
emp,dept;



