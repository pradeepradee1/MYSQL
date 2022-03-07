#DataTypes

1)  #Numeric

	1)	TINYINT()				-	 
									1 bytes  
									Signed 	 	(-128 to 127)
									Unsigned  	(0 to 255)
	
	2)	SMALLINT()				-	
									2 bytes
									signed 		(-32768 to 32768)
									unsigned 	(0 to 65535) 
	
	3)	MEDIUMINT()				-	
									3 bytes
									signed 		( -8388608 to 8388607 )
									unsigned 	( 0 to 16777215 ) 
	
	4)	INT() 				 	-   
									4 bytes 
									signed 		(-2147483648 to 2147483647)
									unsigned 	(0 to 4294967295)
	
	5)	BIGINT()				-	
									8 bytes
									signed 		(9223372036854775808 to 9223372036854775807)
									unsigned 	(0 to 18446744073709551615)

	
	6)	FLOAT(m,d)Precision,Scale-	default to 10,2
									24 places for a float
	
	7)	DOUBLE(m,d)				-	default to 16,4
									53 places for a double
	
									

2)	# Strings

	1)	VARCHAR()				-	#Maximum Size Of 255 Character
	
	2)	TINYTEXT()				-	#Maximum Size Of 255 Character
	
	3)	TEXT()					-	#Maximum Size Of 65,535 Character
									
	4)	MEDIUMTEXT()			-	#Maximum Size Of 16,777,215 Character
	
	5)	LONGTEXT()				-	#Maximum Size Of 4GB or 4,294,967,295 Character
	
	6)	BINARY()				-	#Maximum Size Of 255 Character
	
	7)	VARBINARY()				-	#Maximum Size Of 255 Character





3)	#BLOB(Binary Large Object Binary)	-	#It is used to store files , picures and large voloume of data
	
	1)	TINYBLOB()				-	#Maximum Size Of 255 bytes 
									
	2)	BLOB()					-	#Maximum Size Of 65,535 bytes
									
	3)	MEDIUMBLOB()			-	#Maximum Size Of 16,777,215 bytes
									
	4)	LONGBLOB()				-	#Maximum Size Of 4gb or 4,294,967,295 Character
									


4) 	#DATATIME

	1)	DATE()					-	#represents yyyy-mm-dd
	
	2)	TIME()					-	#represents HH:MM:SS
	
	3)	DATETIME()				-	#represents yyyy-mm-dd hh:mm:ss
	
	4)	TIMESTAMP()				-	#represents YYYY-MM-DD HH:MM:DD 'UTC
	
	5)	YEAR()					-	#represents 4-digit (1901)
	
	
	

