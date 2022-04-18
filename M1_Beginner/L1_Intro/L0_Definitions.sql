/*

Data	:		
			Collection of information of any one Business entity is known as data.

Database	:
			
			It is software, which stores and manages the collection of information of all objects in the business.	
*/

#Table Structure :

#Table	= 	Entity
#Row		=	Tuple
#Column	=	Attribute
#Cell	=	Field

/*
Database Management Systems(DBMS):
		
		A Collection of programs which enables user to access database , manipulate data and represent data


Types DBMS :
			
			1) Hierarchical DBMS

			2) Network DBMS

			3) Relatandional DBMS

			4) Object-oriented DBMS

			
1) Hierarchical DBMS :
						parent-child relationship of storing data.
						It has a structure like a tree with node representing records and branches representing fields

2) Network DBMS	:
						Supports many-to many relations.
						This usally results in complex database structures

3) Relational DBMS :
						defines database relationships in form of tables , also know as relations
						For ex : 1) MS SQL 2) MYSQL

4) Object-Oriented DBMS :
						the data to be stored is in form of objects
						For ex: postgres SQL			

*/


# ETL 			= 	OLTP
# DataWareHouse = 	OLAP

/*
1) OLTP RDBMS	: Online Transactions Processing
				
				It contains Transactinal data/ day to day data / Current data / dynamic data
				It is used to store or process the business data

2) OLAP RDMS   	: On Line Analtical Processing

				It contains historical data / old data.
				It is used to analyze the business.
*/



/*
DataModel :

		For any OLTP RDBMS the data model is E-R ( Entity-Relationship ) Model.
		Create an Entity-Relationship (ER) model is to visually represent the structure of a business database.

Entity And Its Attributes :

		Composite			: 	Can be divided into sub parts (name - > firstname,secondname,lastname)
		
		Simply or atomic	: 	Which are not divisiable are simply know as simple or atomic attributes 
																					(housenumber,phone)

		Single		:	single value for a particular entity know as single-valued attributes
		
		Multi-Valued :	most Number of values allowed for each individual entity


		Stored 		:	Stored attribute are such attribute which are already stored in the database and forms which 				 the value of another attribute is derived is called stored attribute. (Birth_date)

		Derived		:	Attributes which are derived from the real entities are known as derived attributes (Age)



*/



/*
 
MYSQL :
		A Relational Database managment Systems
		An Open-Source Software 
		Provides multi-user access
		Supports-multi-storage engines
		Works on many platforms

*/



