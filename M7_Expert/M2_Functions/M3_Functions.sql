/*
Functions
*/


CREATE or replace FUNCTION functionname()
RETURNS INT
BEGIN
	RETURN 12+1;
END;


SELECT functionname();


-- With Parameters

CREATE or replace FUNCTION functionname1(`a` int)
RETURNS INT
BEGIN
	RETURN 12+`a`;
END;

SELECT functionname1(2);
