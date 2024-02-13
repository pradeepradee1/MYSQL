/*
Set Operators = Records Level Matching
*/
use mydb;

s1={a,b,c,d}
s2={x,y,z,c,b}


#Union 
#Note : Combine the two or more SELECT statements. 

{a,b,c,d,x,y,z}

#UnionAll
{a,b,c,d,x,y,z,c,b}

#InterSection
{c,b}

#Minus
{a,d}
# Note : Minus Operator Not Supported in MYSQL



select * from CUST_BR1
union
select * from CUST_BR2
union
select * from CUST_BR3;


select CNAME as name  from CUST_BR1
union
select CNAME as name from CUST_BR2;


select * from CUST_BR1 
union all
select * from CUST_BR2
union all
select * from CUST_BR3;



SELECT CNAME,MOBILE FROM CUST_BR1
INTERSECT
SELECT CNAME,MOBILE FROM CUST_BR2
INTERSECT
SELECT CNAME,MOBILE FROM CUST_BR3;

#Note : Minus Is not supported in mysql

SELECT * FROM CUST_BR2
Minus
SELECT * FROM CUST_BR1
UNION ALL 
SELECT * FROM CUST_BR3;


/*
Note:
What are the limitations of set operators?
We need to select equal number of columns from each table
We need to select same data type of data in the same sequence under each select
query.
 */


# Error Query

select cname,mobile from cust_br1
union all
select cid from cust_br2;







