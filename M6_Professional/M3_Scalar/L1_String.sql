#ASCII = Function returns the ASCII value for the specific character.
SELECT ASCII(cname) AS NumCodeOfFirstChar FROM customer;

#CHAR_LENGTH
SELECT CHAR_LENGTH("SQL Tutorial")  LengthOfString;

#CHARACTER_LENGTH
SELECT CHARACTER_LENGTH("SQL Tutorial check") AS LengthOfString;

#CONCAT
SELECT CONCAT("SQL ", "Tutorial ", "is ", "fun!") AS ConcatenatedString;

#CONCAT_WS
SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!") AS ConcatenatedString;

#FIELD = Return the index position of  "q" in the string list:
SELECT FIELD("q", "s", "q", "l");

#FING_IN_SET = Search for "q" within the list of strings:
SELECT FIND_IN_SET("q", "s,q,l");

#FORMAT = Format the number as "#,###,###.##" (and round with two decimal places):
SELECT FORMAT(250500.5634, 2);

#INSERT = Insert the string "Example" into the string "W3Schools.com". Replace the first nine characters:
SELECT INSERT("W3Schools.com", 1, 9, "Example");

#INSTR = Search for "3" in string "W3Schools.com", and return position:
SELECT INSTR("W3Schools.com", "3") AS MatchPosition;

SELECT LCASE("SQL Tutorial is FUN!");

#LEFT = Extract 3 characters from a string (starting from left):
SELECT LEFT("SQL Tutorial", 3) AS ExtractString;

SELECT LENGTH("SQL Tutorial") AS LengthOfString;

#LOCATE = Search for "3" in string "W3Schools.com", and return position:
SELECT LOCATE("3", "W3Schools.com") AS MatchPosition;

SELECT LOWER("SQL Tutorial is FUN!");

#LPAD = Left-pad the string with "ABC", to a total length of 20
SELECT LPAD("SQL Tutorial", 20, "ABC");

SELECT LTRIM("     SQL Tutorial") AS LeftTrimmedString;

SELECT MID("SQL Tutorial", 5, 3) AS ExtractString;


SELECT POSITION("3" IN "W3Schools.com") AS MatchPosition;

SELECT REPEAT("SQL Tutorial", 3);

SELECT REPLACE("SQL Tutorial", "SQL", "HTML");

SELECT REVERSE("SQL Tutorial");

#RIGHT = Extract 4 characters from a string (starting from right):
SELECT RIGHT("SQL Tutorial is cool", 4) AS ExtractString;

SELECT RPAD("SQL Tutorial", 20, "ABC");

SELECT RTRIM("SQL Tutorial     ") AS RightTrimmedString;

SELECT SPACE(10);

SELECT STRCMP("SQL Tutorial", "SQL Tutorial ");

SELECT TRIM('    SQL Tutorial    ') AS TrimmedString;

SELECT UCASE("SQL Tutorial is FUN!");

SELECT UPPER("SQL Tutorial is FUN!");




