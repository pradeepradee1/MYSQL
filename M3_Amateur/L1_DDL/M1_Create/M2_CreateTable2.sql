/*


1) Clone the table without data

2) Clone the table with data


*/


/* 

1)
Clone the table without data 

*/

#1.1)
  
CREATE or replace TABLE ClonedPersons LIKE Person;



#1.2)

CREATE TABLE new_table AS
SELECT *
FROM old_table
WHERE 1 = 0;

/* 

2)
Clone the table with data 

*/


CREATE or REPLACE TABLE ClonedPersons SELECT * FROM Person;

CREATE or REPLACE TABLE ClonedPersons SELECT LastName , FirstName  FROM Person;

CREATE or REPLACE  TABLE ModifiedPersons
SELECT PersonID, FirstName + LastName AS FullName FROM Person
WHERE LastName IS NOT NULL;

#Clone tables from different databases:
CREATE or replace TABLE stack2 SELECT * FROM second_db.stack;

CREATE or replace TABLE stack3 SELECT username, password FROM second_db.stack;

