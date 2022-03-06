/*
SET OPERATORS

These Operators are used to select same data type of data and Equal number of column's
data from multiple tables.
(Or)
These operators will display combined data from multiple tables.


*/


/*
1) UNION :
			It will display combined data from multiple tables without duplicates

2) UNION ALL :
			It will display combined data from multiple tables with duplicates

3) INTERSECT :
			It will display common data from multiple tables (From multiple Select stmts)

4) MINUS :
			It will display values from first selection by eliminating values which are repeating in
second selection

*/

For example:
s1={a,b,c,d}
s2={x,y,z,c,b}


#EX 1 :

select * from s1
union
select * from s2;
#output: {a,b,c,d,x,y,z}


#EX 2 :
 
select * from s1
union all
select * from s2;
#output: {a,b,c,d,x,y,z,c,b}

#EX 3 :

select * from s1
intersect
select * from s2;
#output: {c,b}


#EX 4 :

select * from s1
minus
select * from s2;
#output: {a,d}

#Sample Tables:

CREATE TABLE CUST_BR1
(
CID CHAR(3),
CNAME VARCHAR2(20),
MOBILE NUMBER(10),
CITY VARCHAR2(20),
GENDER VARCHAR2(10)
);

INSERT INTO CUST_BR1 VALUES('C1','VIJAY',1212121212,'HYD','MALE');
INSERT INTO CUST_BR1 VALUES('C2','JOHN',1313131313,'DELHI','MALE');
INSERT INTO CUST_BR1 VALUES('C3','SWATHI',1414141414,'HYD','FEMALE');


CREATE TABLE CUST_BR2
(
CID CHAR(3),
CNAME VARCHAR2(20),
MOBILE NUMBER(10),
CITY VARCHAR2(20),
GENDER VARCHAR2(10)
);

INSERT INTO CUST_BR2 VALUES('C1','KIRAN',9898989898,'HYD','MALE');
INSERT INTO CUST_BR2 VALUES('C2','JOHN',1313131313,'DELHI','MALE');
INSERT INTO CUST_BR2 VALUES('C3','LAKSHMI',8989898989,'DELHI','FEMALE');

CREATE TABLE CUST_BR3
(
CID CHAR(3),
CNAME VARCHAR2(20),
MOBILE NUMBER(10),
CITY VARCHAR2(20),
GENDER VARCHAR2(10)
);
INSERT INTO CUST_BR3 VALUES('C1','KIRAN',9898989898,'HYD','MALE');
INSERT INTO CUST_BR3 VALUES('C2','JOHN',1313131313,'DELHI','MALE');
INSERT INTO CUST_BR3 VALUES('C5','VINAY',7878787878,'DELHI','MALE');


#Examples:
#Display all customers info from all branches

select * from cust_br1
union all
select * from cust_br2
union all
select * from cust_br3;


#Get the customer details without duplicates
select * from cust_br1
union
select * from cust_br2
union
select * from cust_br3;


#DISPLAY COMMON CUSTOMER NAMES AND MOBILE NUMBERS FROM ALL BRANCHES
SELECT CNAME,MOBILE FROM CUST_BR1
INTERSECT
SELECT CNAME,MOBILE FROM CUST_BR2
INTERSECT
SELECT CNAME,MOBILE FROM CUST_BR3;


#DISPLAY CUSTOMERS DETAILS WHO IS THE ONLY CUSTOMER FOR BRANCH 2
SELECT * FROM CUST_BR2
MINUS
(
SELECT * FROM CUST_BR1
UNION ALL
SELECT * FROM CUST_BR3
);



/*
Note:
What are the limitations of set operators?
We need to select equal number of columns from each table
We need to select same data type of data in the same sequence under each select
query.
Ex:
select cname,mobile from cust_br1
union all
select cid from cust_br2;
select cname,mobile from cust_br1
*
ERROR at line 1:
ORA-01789: query block has incorrect number of result columns
SQL> select cname,mobile from cust_br1
2 union all
3 select mobile,cname from cust_br2;
select cname,mobile from cust_br1
*
ERROR at line 1:
ORA-01790: expression must have same datatype as corresponding expression
*/





