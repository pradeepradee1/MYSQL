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

6) 	It is desgined to support for transaction operations like insert,update,delete (OLTP System)
	
	It is desgined to support for analytical operations like select statement (OLAP System)	

*/
