/*
Difference Between Normalization and DeNormalization

1) 	Normaliztion is the technique of dividing the data into multiple tables to reduce 
	data redundancy and inconsistency and to acheive the data integrity
	
	DeNormalization is the technique of combining the data into a single table to make data retrieval faster
	
2) 	Normalization is used in OLTP systems which emphasizes on making the insert,delete,and 
	update anomalies faster 
	
	DeNormalization is used on OLAP systems which emphasizes on making the search and analysis faster
	
3)	Data Integrity is maintained in normalization process
	
	Data Integrity is harder to retain
	
4)	Redundant data is eliminated in Normalization

	Redundant data increase in DeNormalization
	
5)	Normalization increases the number of tables and joins 

	DeNormalization reduces the number of tables and joins 
	
6)	Disk Space is optimized in normalized table
	
	Disk Space is wasted in denormalized table because the same data is stored in different places

*/


/*
Conclusion :

Normalizaion is used when the faster insertion , deletoion , updation anomalies 
and data consistency are necessarily required

Denormalization is used when the faster search is more important and to optimize the read performance
*/




*/