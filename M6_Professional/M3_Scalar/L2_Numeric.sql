#Maths Functions:
	
	SELECT PI();

	
	SELECT AVG(Price) AS AveragePrice FROM Products;

	SELECT COUNT(c.Cno) AS Customer FROM customer c;	
	
	SELECT MAX(c.Cno) AS CustomerNumber FROM customer c ;
	
	SELECT MIN(c.Cno) AS CustomerNumber FROM customer c ;

	SELECT sum(c.Cno) AS CustomerNumber FROM customer c ;
	


	
	SELECT SQRT(64);
	SELECT POWER(4, 2);
	
	
	SELECT EXP(1);
	SELECT LOG(2);
	

	SELECT GREATEST(3, 12, 34, 8, 25);
	SELECT LEAST(3, 12, 34, 8, 25);
	

	
	SELECT FLOOR(25.95); # flooring
	SELECT CEIL(25.152); # Ceiling(Roof ceiling)
	SELECT ROUND(25.452);


	SELECT RAND();
	# SIGN  = 
	#		If number > 0, it returns 1
	#		If number = 0, it returns 0
	#		If number < 0, it returns -1
	SELECT SIGN(255.5);	



	#Truncate = Return a number truncated to 2 decimal places:
	SELECT TRUNCATE(135.375, 2); #135.37
	SELECT FORMAT(135.375, 2); #135.38
	SELECT FORMAT(250500.5634, 2); #250,500.56








	
	
	#Theata Functions
		
		SELECT ABS(-243.5);
	
		SELECT ACOS(0.25);
	
		SELECT ASIN(0.25);
	
		SELECT ATAN(2.5);
	
		SELECT ATAN2(0.50, 1);

		SELECT COS(2);

		SELECT COT(6);
		
		SELECT SIN(2);

		SELECT TAN(1.75);

		SELECT DEGREES(1.5);

















