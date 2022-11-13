/*

Normalization:

	1)		Normalization Divides the larger table into smaller table and links them using relationship
				
	2) 		Normalization is the process of reducing the redundancy (repetation) of data in the table and 
			improving the data integrity 

	3) 		Without Normalization we may face issues like the Insertion anomaly, 
			Updation anomaly,Deletion anomaly

*/

use mydb;

select * from normalization

/*
What is Anomaly ?
			
		When data is multiply copy , we updating the data at one place but we forget the data 
		at another place
	
		Insertion Anomaly 
							: 1) If I want to insert the new MECH depatment in above table ,
							     Since it has no student , we may have as issues


		Updation Anomaly
							: 1) If I want to update the building and room_no for CSE
							     since It Has million of records , it might take more time to update

							  2) If I forget to update at another records as same as for CSE
							     data could be inconsistency problem

		Delition Anomaly			
							:
							  1) If I want to delete the student's details of ECE department
							  	 Since It has single records of ECE ,might lose the department details
*/



/*
DataBase Normal Forms:
	
		1NF(First Normal Form)
		2NF(Second Normal Form)
		3NF(Third Normal Form)
		BCNF(Boyce-codd Normal Form)

*/
