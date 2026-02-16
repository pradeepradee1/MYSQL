/*
#Question:
#			Get The Employee who has the diabetes 1 in condition attribute

*/

CREATE TABLE Temp (
    id INT,
    name VARCHAR(50),
    condition_codes VARCHAR(100)
);

INSERT INTO Temp (id, name, condition_codes) VALUES
(1, 'Daniel', 'YFEV COUGH'),
(2, 'Alice', NULL),
(3, 'Bob', 'DIAB100 MYOP'),
(4, 'George', 'ACNE DIAB100'),
(5, 'Alain', 'DIAB201');




select 
	*
from 
	Temp



#Right Approach
select 
	*
from 
	Temp
WHERE conditions like '%DIAB1%'

#Right Approach
select 
	*
from 
	Temp
WHERE conditions REGEXP 'DIAB1'

# It is not working
select 
	*
from 
	Temp
WHERE conditions REGEXP '^[DIAB1]'

#Both Query are same
select 
	*
from 
	Temp
WHERE conditions REGEXP '[DIAB1]'

