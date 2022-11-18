/*
Difference Between Normalization and DeNormalization

1) 	Normaliztion is the technique of dividing the data into multiple tables to acheive the data integrity
 	by reducing the data redundancy and inconsistency 
	
	DeNormalization is the technique of combining the data into a single table to acheive data retrieval faster
	
2)	Redundant data is eliminated in Normalization

	Redundant data increase in DeNormalization

3)	Data Integrity is maintained in normalization process
	
	Data Integrity is harder to retain
	
4)	Normalization increases the number of tables and joins 

	DeNormalization reduces the number of tables and joins 
	
5)	Disk Space is optimized in normalized table
	
	Disk Space is wasted in denormalized table because the same data is stored in different places

6) 	Normalization is used in OLTP systems and making the insert,delete,and 
	update anomalies faster 
	
	DeNormalization is used on OLAP systems and making the search faster	

*/
