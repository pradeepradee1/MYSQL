/*


#Difference between SQL and PL/SQL
SQL :
	It Interact with RDBMS
	Which allows us to do operations like DDL, DML , DQL operations.

PL/SQL :
	PL/SQL is Oracle procedural extension to SQL
	Which allows us to do conditions, loops, functions, procedure and error handling



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


# OLTP represents the database's behaviour
# OLAP represents the DataWareHouse's behaviour

/*
1) OLTP (RDBMS)	: Online Transactions Processing

				It Store the structure data
				It is suitable for handling the small volume of data
				It is optimized for the quick access
				Data is frequently used in insert, update, delete statement which comes under the DML statement
				Data will be normalized form
				It will care the ACID properties

2) OLAP (DWH)   : OnLine Analtical Processing

				It Store the structure data
				It is suitable for handling the large volume of data
				It Optimized for analysis the complex queries on historical data
				Data is frequently used in select statement for data retriveal which comes under the DQL statement 
				Data will be De-normalized form
				It will care about the ACID properties

Note : Modern data warehouse take care about the ACID Proerties EX : Azure synapse anlytics , Snowflake , Redshift
*/



/*
DataModel :

		For any OLTP RDBMS the data model is E-R ( Entity-Relationship ) Model.
		ER model is to visually represent the structure of a business database.
		Where Entities or Tables are linked by the defined relationship which expressing the dependicies and requirements.


Entity And Its Attributes :


		Simple or Atomic Attributes : 	Cann't be divided into sub parts
										It simply know as simple or atomic attributes 
										Ex : housenumber,phone	

		Composite Attributes		: 	Can be divided into sub parts 
										Ex : name - > firstname,secondname,lastname

		Single Attributes			:	the attribute contain the single value know as single-valued attributes
		(Single Class)

		Binary Attributes			:	the attribute contain the binary value know as Binary-valued attributes
		(Binary Class)

		Multi-Valued Attributes 	:	the attribute contain the most Number of values 
		(Multi Class)

		Stored Attributes			:	Attributes which are already stored in the database
										Eg : (Birth_date)
		 				

		Derived	Attributes			:	Attributes which we can create new from the existing attributes 
										Eg : (Age)


*/




