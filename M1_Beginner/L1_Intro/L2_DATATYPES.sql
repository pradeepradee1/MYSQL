#DataTypes

1)  #INTEGER

	1)	TINYINT()				-	# represents small integers
									# signed range of -128 to 127
									# unsigned range of 0 to 255
	
	2)	SMALLINT()				-	# represents integers
									# signed range of -32768 to 32768
									# unsigned range of 0 to 65535
	
	3)	MEDIUMINT()				-	# represents integers
									# signed range of -8388608 to 8388607
									# unsigned range of 0 to 16777215
	
	4)	INT() AS ALSO INTEGER 	-	# represents an integer of normal size
									# signed (the default setting), the range spans -2147483648 to 2147483647
									# unsigned, the range spans 0 to 4294967295
	
	5)	BIGINT()				-	# represents integers
									# signed range of 9223372036854775808 to 9223372036854775807
									# unsigned range of 0 to 18446744073709551615

	6)	BOOLEAN()				-	# Value 0 with False 
									# Value 1 with True
	
	7)	FLOAT()					-	
	
	8)	DOUBLE()				-	
	
	9)	DECIMAL()				-	
	
	10)	BIT()					-	#represents bit fields
									

2)	#STRING
	1)	BINARY()				-	#represents binary byte strings
	
	2)	VARBINARY()				-	#represents binary byte strings of variable length
	
	3)	CHAR()					-	#represents a right-padded, fixed-length string containing spaces	
									#M represents column length of characters in a range of 0 to 255
									
	4)	VARCHAR()				-	#represents a variable-length string
									#M range (maximum column length) of 0 to 65535
	
	5)	TINYTEXT()				-	#represents a text column with a maximum length of 255
									#In storage, each uses a one-byte length	
	
	6)	TEXT()					-	#represents a text column with a maximum length of 65,535
									#In storage, each uses a two-byte length
	
	7)	MEDIUMTEXT()			-	#represents a text column with a maximum length of 16,777,215
									#In storage, each uses a three-byte length
	
	8)	LONGTEXT()				-	#data type represents a text column with a maximum length of 4,294,967,295 OR 4 GB
									#In storage, each uses a four-byte length
	
	9)	ENUM()					-	#represents a string object having only a single value from a list
	
	10) SET()					-	#represents a string object having zero or more values from a list
	

	
3)	#LOB(LARGE OBJECT)			-	#It is used to store higher volumes of data and max size is 4 GB.
	
	1)	TINYBLOB()				-	#epresents a blob column with a maximum length of 255
									#each uses a one-byte length

	2)	BLOB()					-	#represents a blob column with a maximum length of 65,535
									#each uses a two-byte length
	
	3)	MEDIUMBLOB()			-	#epresents a blob column with a maximum length of 16,777,215
									#each uses a three-byte length
	
	4)	LONGBLOB()				-	#epresents a blob column with a maximum length of 4,294,967,295
									#each uses a four-byte length 


4) 	#DATATIME

	1)	DATE()					-	#represents 9999-12-31
	2)	TIME()					-	#represents 838:59:59.999999
	3)	DATETIME()				-	#represents 1000-01-01 00:00:00.000000
	4)	TIMESTAMP()				-	#represents a timestamp of the YYYY-MM-DD HH:MM:DD
	5)	YEAR()					-	#represents a year in 4-digit format of 1901




	
	
	
	



