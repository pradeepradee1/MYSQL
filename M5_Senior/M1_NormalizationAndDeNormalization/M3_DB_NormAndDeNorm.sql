/*
Difference Between Normalization and DeNormalization

1) 	Normaliztion is the technique of dividing the data into multiple tables
	
	DeNormalization is the technique of combining the data into a single table
	
2)	Redundant data is eliminated in Normalization

	Redundant data increase in DeNormalization

3)	Data Integrity is maintained in normalization process
	
	Data Integrity is harder to retain
	
4)	Normalization increases the number of tables and joins 

	DeNormalization reduces the number of tables and joins 
	
5)	Memory optimized in normalized table
	
	Memory is not optimized in denormalized table because the same data is stored in different places

6) 	It is suit for OLTP
			It is optimized for the quick access
			Data is frequently used for insert, update, and delete which comes under the DML operation
	
	It is suit for OLAP 
			It Optimized for analysis the complex  queries on historical data 
			Data is frequently used for retrieval 


*/
