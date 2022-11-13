#1NF 
use mydb;

SELECT * from First_1NF;
SELECT * from First_1NF_1;
SELECT * from First_1NF_2;

#1NF = First_1NF_2

/*
1NF:
	1) Each Attribute should have unique name (phone_no shouldn't repeat)
	2) Each Attribute should contain the atomic values
	3) Every Attribute should follow the same domain (Same Data type)
	4) No Ordering to rows and columns
	5) No Duplicate Rows


*/
