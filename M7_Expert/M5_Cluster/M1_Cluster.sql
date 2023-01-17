/*
Cluster
*/

#Note
#CLUSTER Keyword does not support in MYSQL and disambiguation in MYSQL

CREATE TABLE emp (
	empno NUMBER(5) PRIMARY KEY,
	ename VARCHAR2(15) NOT NULL,
	deptno NUMBER(3) REFERENCES dept
)
CLUSTER emp_dept (deptno);




CREATE TABLE dept (
deptno NUMBER(3) PRIMARY KEY 
)
CLUSTER emp_dept (deptno);