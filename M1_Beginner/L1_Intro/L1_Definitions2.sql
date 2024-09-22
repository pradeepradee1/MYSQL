/*

Database Management Systems(DBMS):
		
		A Collection of programs 
		which enables the user to access database and represent data.
		For ex : Manager access the employee and represent work to client


Types DBMS :
			
			1) Hierarchical DBMS

			2) Network DBMS

			3) Relational DBMS

			4) Object-oriented DBMS


1) Hierarchical DBMS :
						This Model follows the parent-child relationship for storing data.

2) Network DBMS	:
						This Model follows the many-to many relations.

3) Relational DBMS :
						It is collections of information in the form of tables with relations
						For ex : 
								 1) MS SQL 
								 2) MYSQL
4) Object-Oriented DBMS :
						
						It is similar to RDBMS
						but It Stores data  in the form of objects.
						For ex: 
								 1) postgres SQL			

*/


# ETL 			= 	OLTP
# DataWareHouse = 	OLAP

/*
1) OLTP RDBMS	: Online Transactions Processing
				Data will be normalized form
				It is desgined to support for transaction operations like insert,update,delete 
				It is supporting the ACID properties

2) OLAP RDBMS   : OnLine Analtical Processing

				Data will be De-normalized form
				It is desgined to support for analytical query (select query) 
				It will not care about the ACID properties
*/



/*
DataModel :

		For any OLTP RDBMS the data model is E-R ( Entity-Relationship ) Model.
		ER model is to visually represent the structure of a business database.
		Where Entities or Tables are linked by the defined relationship which expressing the dependicies and requirements.


Entity And Its Attributes :


		Simple or Atomic Attributes : 	Which are not divisiable are simply know as simple or atomic attributes 
																					(housenumber,phone)	

		Composite Attributes		: 	Can be divided into sub parts (name - > firstname,secondname,lastname)
		


		Single(Single Class)		:	single value for a particular entity know as single-valued attributes
		
		Multi-Valued(multi Class) 	:	most Number of values allowed for each individual entity


		Stored Attributes			:	Attributes which are already stored in the database(Birth_date)
		 				

		Derived	Attributes			:	Attributes which are derived from the real entities are known as derived attributes 
																											(Age)


*/




