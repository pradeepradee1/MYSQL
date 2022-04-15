/*
Source : 
1) Youtube(edureka)
2) https://www.edureka.co/blog/normalization-in-sql/

Introduction:
				Data in Databases is stored in terms of enormous quantity.
				Retrieving certain data wil be a tedious task if the data is not organized correctly
				With the Help of Normalizations, We Can organize this data and also reduces the redundant data 

Normalization :
				
				1) Normalization is the process of reducing the redundancy of data in the table and 
				improving the data integrity 
				2) Without Normalization we may face issues like the Insertion anomaly, 
				Updation anomaly,Deletion anomaly
*/


/*
DataBase Normal Forms:
	
	Here is a list of NormalForms in SQL:
		1NF(First Normal Form)
		2NF(Second Normal Form)
		3NF(Third Normal Form)
		BCNF(Boyce-codd Normal Form)

*/

#1NF 
use mydb;

SELECT * from First_1NF;
SELECT * from First_1NF_2;

#1NF = First_1NF_2

/*
1NF:
	1) In This Normal Form, we tackle the problem of atomicity.
	2) Which means a Single Cell should hold Single Value 
	(ex: multiple phone number values are present in First_1NF columns)
	3) If table contains multi-valued attribute it violates the First Normal Form
*/

SELECT * from Second_2NF ;
SELECT * from Second_2NF_1 ;
SELECT * from Second_2NF_2 ;

#2NF
/*
2NF:
	1) Table Has to be follow 1st NF
	2) In the Table should not have partial dependency,
	   attributes are fully dependent on the priymary key of the table,
	   
	(ex: Second_2NF_2(table) Office attribute should be fully dependent on the EmployeeID(PK)
	
*/


SELECT * from Third_NF ;
SELECT * from Third_NF_1 ;
SELECT * from Third_NF_2 ;
#3NF
/*
3NF:
	1) Table Has to be follow 2nd NF
	2) There should not be transitive dependency
	
	For Ex: 1) X -> Z indirectly X -> Y -> Z
			2) Third_NF(table) StidentID -> SubjectID -> SubjectName
			3) Third_NF_1 and Third_NF_2 In this table all the non-key attributes are now fully dependent on PK
			4) Third_NF_1(table) StudentName,SubjectID,Address are dependent on studentId
			5) Third_NF_2(table) Subject is dependent on SubjectID 
*/

SELECT * from BC_NF;
SELECT * from BC_NF_1 ;
SELECT * from BC_NF_2 ;

#BC Normal Form
/*
BCNF (Boyce Codd Normal Form):

		It Has to follow the 3rd Normal Form and higher version 3NF
		Every Fuctional dependency A -> B , then A has to be the super key of that particular table
	
*/
