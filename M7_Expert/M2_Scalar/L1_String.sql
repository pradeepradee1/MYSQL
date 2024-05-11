#1)ASCII	:
	SELECT ASCII(cname) AS NumCodeOfFirstChar FROM customer;
	
#CHAR_LENGTH :
	-- SELECT CHAR_LENGTH("SQL Tutorial")  LengthOfString;
	
#CHARACTER_LENGTH
	-- SELECT CHARACTER_LENGTH("SQL Tutorial check") AS LengthOfString;

#2)LENGTH
	SELECT LENGTH("SQL Tutorial") AS LengthOfString;

#3)CONCAT
	SELECT CONCAT("SQL ", "Tutorial ", "is ", "fun!") AS ConcatenatedString;
	SELECT CONCAT(4, "Tutorial ", "is ", "fun!") AS ConcatenatedString;

#4)CONCAT_WS
	SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!") AS ConcatenatedString;

#5)FORMAT 
	SELECT FORMAT(250500.5634, 2);
	
#6)FIELD
	SELECT FIELD("q", "s", "q", "l");

#7)FIND_IN_SET
	SELECT FIND_IN_SET("q", "s,q,l");

#8)LOCATE 
	SELECT LOCATE("3", "W3Schools.com") AS MatchPosition;

#9)POSITION	
	SELECT POSITION("3" IN "W3Schools.com") AS MatchPosition;

#10)INSTR (Always prefer the INSTR because ( Source String is coming first & Target is second) for ex: ("W3Schools.com", "3")) 

	SELECT INSTR("W3Schools.com", "3") AS MatchPosition;

#11)INSERT = Insert the string "Example" into the string "W3Schools.com". Replace the first nine characters:
	SELECT INSERT("W3Schools.com", 1, 0, "Example");

#12)REPLACE
	SELECT REPLACE("SQL Tutorial", "SQL", "HTML");

#13)REVERSE
	SELECT REVERSE("SQL Tutorial");
	
#14)REPEAT
	SELECT REPEAT("SQL Tutorial", 3);
	
#15)LOWER
	SELECT LOWER("SQL Tutorial is FUN!");

#16)LCASE
	SELECT LCASE("SQL Tutorial is FUN!");

#17)UCASE
	SELECT UPPER("SQL Tutorial is FUN!");

#18)UPPER
	SELECT UCASE("SQL Tutorial is FUN!");

#19)LEFT = Extract 3 characters from a string (starting from left):
	SELECT LEFT("SQL Tutorial", 3) AS ExtractString;

#20)MID
	SELECT MID("SQL Tutorial", 5, 3) AS ExtractString;

#21)RIGHT = Extract 4 characters from a string (starting from right):
	SELECT RIGHT("SQL Tutorial is cool", 4) AS ExtractString;

#22)RPAD
	SELECT RPAD("SQL Tutorial", 20, "ABC");
	
#23)LPAD = Left-pad the string with "ABC", to a total length of 20
	SELECT LPAD("SQL Tutorial", 20, "ABC");

#24)TRIM
	SELECT TRIM('    SQL Tutorial    ') AS TrimmedString;

#25)LTRIM
	SELECT LTRIM("     SQL Tutorial") AS LeftTrimmedString;

#26)RTRIM
	SELECT RTRIM("SQL Tutorial     ") AS RightTrimmedString;

#27)String Compare
	SELECT STRCMP("SQL", "SQL"); 	-- 	0
	SELECT STRCMP("SQL12", "SQL"); 	-- 	1
	SELECT STRCMP("SQL", "SQL12"); 	-- -1
	SELECT STRCMP("SQL", NULL); 	-- 	NULL

#28)SPACE
	SELECT SPACE(10);
