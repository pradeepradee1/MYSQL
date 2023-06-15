#1)ASCII	:
	SELECT ASCII(cname) AS NumCodeOfFirstChar FROM customer;
	
#2)CHAR_LENGTH :
	SELECT CHAR_LENGTH("SQL Tutorial")  LengthOfString;
	
#3)CHARACTER_LENGTH
	SELECT CHARACTER_LENGTH("SQL Tutorial check") AS LengthOfString;

#4)LENGTH
	SELECT LENGTH("SQL Tutorial") AS LengthOfString;

#5)CONCAT
	SELECT CONCAT("SQL ", "Tutorial ", "is ", "fun!") AS ConcatenatedString;
	SELECT CONCAT(4, "Tutorial ", "is ", "fun!") AS ConcatenatedString;

#6)CONCAT_WS
	SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!") AS ConcatenatedString;

#7)FORMAT 
	SELECT FORMAT(250500.5634, 2);
	
#8)FIELD = Return the index position of  "q" in the string list:
	SELECT FIELD("q", "s", "q", "l");

#9)FIND_IN_SET = Search for "q" within the list of strings:
	SELECT FIND_IN_SET("q", "s,q,l");

#10)LOCATE = Search for "3" in string "W3Schools.com", and return position:
	SELECT LOCATE("3", "W3Schools.com") AS MatchPosition;

#11)POSITION	
	SELECT POSITION("3" IN "W3Schools.com") AS MatchPosition;

#12)INSTR = Search for "3" in string "W3Schools.com", and return position:
	SELECT INSTR("W3Schools.com", "3") AS MatchPosition;

#13)INSERT = Insert the string "Example" into the string "W3Schools.com". Replace the first nine characters:
	SELECT INSERT("W3Schools.com", 1, 9, "Example");

#14)REPLACE
	SELECT REPLACE("SQL Tutorial", "SQL", "HTML");

#15)REVERSE
	SELECT REVERSE("SQL Tutorial");
	
#16)REPEAT
	SELECT REPEAT("SQL Tutorial", 3);
	
#17)LOWER
	SELECT LOWER("SQL Tutorial is FUN!");

#18)LCASE
	SELECT LCASE("SQL Tutorial is FUN!");

#19)UCASE
	SELECT UPPER("SQL Tutorial is FUN!");

#20)UPPER
	SELECT UCASE("SQL Tutorial is FUN!");

#21)LEFT = Extract 3 characters from a string (starting from left):
	SELECT LEFT("SQL Tutorial", 3) AS ExtractString;

#22)MID
	SELECT MID("SQL Tutorial", 5, 3) AS ExtractString;

#23)RIGHT = Extract 4 characters from a string (starting from right):
	SELECT RIGHT("SQL Tutorial is cool", 4) AS ExtractString;

#24)RPAD
	SELECT RPAD("SQL Tutorial", 20, "ABC");
	
#25)LPAD = Left-pad the string with "ABC", to a total length of 20
	SELECT LPAD("SQL Tutorial", 20, "ABC");

#26)TRIM
	SELECT TRIM('    SQL Tutorial    ') AS TrimmedString;	

#27)LTRIM
	SELECT LTRIM("     SQL Tutorial") AS LeftTrimmedString;

#28)RTRIM
	SELECT RTRIM("SQL Tutorial     ") AS RightTrimmedString;

#29)String Compare
	SELECT STRCMP("SQL", "SQL"); 	-- 	0
	SELECT STRCMP("SQL12", "SQL"); 	-- 	1
	SELECT STRCMP("SQL", "SQL12"); 	-- -1
	SELECT STRCMP("SQL", NULL); 	-- 	NULL

#30)SPACE
	SELECT SPACE(10);
