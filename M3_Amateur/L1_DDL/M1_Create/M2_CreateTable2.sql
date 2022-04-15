/*
DDL
*/

/*
Create a Table from another table
*/

use mydb;

#Table STRUCTURE 

#Options 1
SHOW CREATE TABLE Account;
#Options 2
desc Account;


#Cloning a Table
CREATE or replace TABLE ClonedPersons LIKE Person;

#Cloning a Table with records
CREATE or REPLACE TABLE ClonedPersons SELECT * FROM Person;

CREATE or REPLACE TABLE ClonedPersons SELECT LastName , FirstName  FROM Person;

CREATE or REPLACE  TABLE ModifiedPersons
SELECT PersonID, FirstName + LastName AS FullName FROM Person
WHERE LastName IS NOT NULL;

#Clone tables from different databases:
CREATE or replace TABLE stack2 SELECT * FROM second_db.stack;

CREATE or replace TABLE stack3 SELECT username, password FROM second_db.stack;


#Note :
#Primary keys and indexes will not be preserved when creating tables from SELECT . You must redeclare them:
CREATE or REPLACE TABLE ModifiedPersons (PRIMARY KEY (PersonID))
SELECT PersonID, FirstName + LastName AS FullName FROM Person
WHERE LastName IS NOT NULL;


