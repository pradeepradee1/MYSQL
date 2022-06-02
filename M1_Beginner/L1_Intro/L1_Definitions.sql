/*

Data		:
			
				Collection of information of any one Business entity is known as data.
			
Database	:
			
				It is software, 
				Collection of information of all entity or objects or table will be stored in database
			
*/

#Table Structure :

#Table	= 	Entity
#Row	=	Tuple
#Column	=	Attribute
#Cell	=	Field

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
				
				It contains Transactinal data (or) day to day data (or) dynamic data
				It is used to store or process the business data

2) OLAP RDBMS   : OnLine Analtical Processing

				It contains historical data.
				It is used to analyze the business.
*/



/*
DataModel :

		For any OLTP RDBMS the data model is E-R ( Entity-Relationship ) Model.
		ER model is to visually represent the structure of a business database.
		Where Entities or Table are linked by the defined relationship which expressing the dependicies and requirements.


Entity And Its Attributes :

		Composite 			: 	Can be divided into sub parts (name - > firstname,secondname,lastname)
		
		Simply or Atomic	: 	Which are not divisiable are simply know as simple or atomic attributes 
																					(housenumber,phone)

		Single				:	single value for a particular entity know as single-valued attributes
		
		Multi-Valued 		:	most Number of values allowed for each individual entity


		Stored 				:	Attributes which are already stored in the database(Birth_date)
		 				

		Derived				:	Attributes which are derived from the real entities are known as derived attributes 
																											(Age)



*/




