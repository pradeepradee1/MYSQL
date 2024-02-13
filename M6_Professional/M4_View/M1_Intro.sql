/*
View :
		It is a database object
		It is a virtual table
		It is created over an SQL Query
		It Doesn't store any data
		Main objective is Hiding the logic from the user
		It improves the performance of queries and database (reduces number of hits to the database)

Types of Views : 

		1) Simple View or Updateable View	:
							It is created based on single table data. 
							It allows dml operations.
		
		2) Composite view or read only view	:
							It is created based on morethan one table data. 
							It doesnt allow dml operations.


NOTE :
		Due to maintain confidential data , we can create virtual table and share it to vendor.

*/

/*
Main Purpose Of Using View / Advantages Of Views
		
		1) Security 
					By Hiding the query used to generate the view

		2) Simplify the complex sql queries
					sharing a view is better than sharing complex query

*/