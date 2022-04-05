/*
Source : Youtube(edureka)
Normalization :
				
				Normalization is a database design technique that reduces data redundancy(repetitive) and 
				eliminates undesirable characteristics 
				like Insertion Anomalies , Update Anomalies, Delete Anomalies  
				
				It Involves constructing tables and setting up relationship between those tables according to 
				some certain rules
				
				The Purpose of Normalization is to eliminate the redundant(repetitive) data and 
				ensure data is stored logically

*/


/*
DataBase Normal Forms:
	
	Here is a list of NormalForms in SQL:
		1NF(First Normal Form)
		2NF(Second Normal Form)
		3NF(Third Normal Form)
		BCNF(Boyce-codd Normal Form)
		4NF(Fourth Normal Form)
		5NF(Fifth Normal Form)
		6NF(sixth Normal Form)
*/

#1NF 
use mydb;

SELECT * from First_1NF;
SELECT * from First_1NF_2;

#1NF = First_1NF_2

/*
1NF:
	Each Table Cell Should Contain a Single Value(ex: multiple phone number values are present in First_1NF columns)
	Each Records needs to be unique
*/

SELECT * from Second_2NF ;
SELECT * from Second_2NF_1 ;
SELECT * from Second_2NF_2 ;

#2NF
/*
2NF:
	Be in 1NF
	Table also should not contain partial dependency
	
*/


SELECT * from Third_NF ;
SELECT * from Third_NF_1 ;
SELECT * from Third_NF_2 ;
#3NF
/*
3NF:
	Be in 2NF
	There should not be transitive dependency for non-prime attirbutes
	
*/

SELECT * from BC_NF;
SELECT * from BC_NF_1 ;
SELECT * from BC_NF_2 ;

#BC Normal Form
/*
BC NF:
		It Has to be in 3rd Normal Form
		Every Fuctional dependency A -> B , then A has to be the super key of that particular table
	
*/
