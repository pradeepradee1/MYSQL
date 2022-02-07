/*
NORMALIZATION AND DENORMALIZATION CONCEPTS
*/

/*
Consider I Have Two tables and data.

Note:
By using above tables we are unable fetch the complete data of an object, like, department
name of any employee, number of employees in dept and etc.

The solution for such kind of requirements we have 2 methods.

1) Maintaining all the information in one big table [DENORMALIZED DATA]
2) Maintaining data in different tables and implement Physical relationships between the tables [NORMALIZED DATA]

*/



/*
1) DENORMALIZATION :
					Maintaining all information in one big table is known as De-normalized method.


Note:
From the above table we will get the required information, but it has
    1) data duplicacy
    2) it occupies more disk space 
    3) data retrieval time is very high.
  
Disk space:
			6X9=54 kb
			
*/

/*
2) NORMALIZATION :
					The Process of dividing the above big table in to sub tables until the data duplicacy is
					maximum reduced is called normalization process.
					
					1) Ist NF(normal form):
						Dividing the table into sub tables based on repeated groups of data.
						
						EX :
						Emp Table:
						
						create table emp
						as
						select eid,ename,sal from emp_dept_details;
						
						DEPT table:
						create table dept
						as
						select dno,dname,loc from emp_dept_details;
					
					2) IInd NF(normal form):
						Eleminating duplicates and defining primary keys
						
						Ex: Eleminating Duplicate records
						create table dept1
						as
						select distinct dno,dname,loc from dept;
						
					3)  IIIrd NF(normal form):
						Implementing relationships between the tables by using Primary key of dept table ,
						define the foreign key column under emp table.
						
						It occupies less disk space and max .data duplicacy is reduced.
						
						disk space :  4X9=36
									  3X3=9
									  45KB
						Advantages:
						--Searching for required data is as much as fast
						--And data retrieval is fast
						--Max data duplicacy is eleminated.
						--Occupy less Disk space.
*/



