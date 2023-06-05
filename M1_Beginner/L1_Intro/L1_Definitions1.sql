/*
					
Data				:
					
						Collection of information of any one Business entity is known as data.
					
Database			:
					
						Collection of information of all entity or objects or table will be stored in database
					
Types Of DataBase	:
						1)	Transactional DataBase (RDBMS) 	Ex : Mysql,Postgresql,Oracle
						2)	NOSQL DataBase				  	Ex : Hbase,Cassandra,MongoDB,CouchDB
											
					
1) 	Transactional DataBase	:
								1)	Stores data in row based form
								2)	Consistent (Multiple or concurrent user will get same answer)
								3)	Vertical Scalable (Scale Out)
2)	NOSQL DataBase			:	
								1) 	Stores data in Columner,key-value,Graph,document form
								2)	Not Consistent as like RDBMS
								3) 	Distributed
								4)	Highly available
								5)	Horizontal Scalable (Scale Up)
					
*/ 					
                     
#Note :
# Highly available	=	(DB can easily and quickly UP , It will not take too much time)

/*
					

Transactional DataBase Follows the ACID Properties :

		A 	=	Atomicity

					Entire transaction takes place at once,there is no midway,either success or failure

				Ex : Atm Transations
				
		C  	=	Consistency
					
					Data should be consistent before and after the transaction
				
				For Example	:	A is sending 100 amount to B 
				success = if the transaction success 100 debited in A and 100 is credited in B (Consistent)
				failed 	= if the transaction failed 100 debited in A and 100 is not credited in B (In Consistent)
				
				success	= commit will happen
				failure	= roll back will happen
				
		I 	=	Isolation 

					multiple transaction will excute without impacting each other
				
				For Example :  A is writing the query , B is reading the query and C is Writing the query
							   A,B,C are not impacting with each other
				
		D   =   Durability 	(holding the data in the logs) 
							(persist data from failure occurs)	
				
				
Responsbility	:
		
Atomicity		=	Transaction Manager
Consistency		=	Application programmer
Isolation		=	Concurrency Control Manager
Durability		=	Recovery Manager


*/


/*

CAP Theorem	:
				There is no database as such which can provide all three properties at once
				Only two can be achived

C	=	Consistency
A 	=	Avaliablity (DB can easily and quickly UP , It will not take too much time)
P   = 	Partition tolerance (distibution)

							 C
					MYSQL	/ \   Hbase,Mongo
						   /   \
						  A-----P	
					Cassandra,scyllaDB



Consistency		=	Data should be consistent before and after the transaction
					Data is the same across the cluster , So you can read data from any node and get same data

Avaliablity		=	Cluster has Ability to access , even if a node goes down in the cluster 

Partition		=	Cluster continues to function , even if there is a communication break between two node


*/

#Note
#Here When and Where to use the SQL and NoSQL DataBase


#Table Structure :

#Table	= 	Entity
#Row	=	Tuple
#Column	=	Attribute
#Cell	=	Field




#Note : 

#Consistency in CAP theorem is not same as Consistency in RDBMS ACID.
#CAP consistency talks about data consistency across cluster of nodes and not on a single server/node.

