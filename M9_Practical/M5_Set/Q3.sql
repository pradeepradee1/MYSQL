/*
Our Task: Our task is to get the mismatched records from both tables and print them in the output.

IP1

| ID | Name    |
| -- | ------- |
| 1  | Alice   |
| 2  | Bob     |
| 3  | Charlie |


IP2

| ID | Name  |
| -- | ----- |
| 1  | Alice |
| 2  | Bobby |
| 4  | David |



Expected Output :

| ID | Name_Table1 | Name_Table2 |
| -- | ----------- | ----------- |
| 2  | Bob         | Bobby       |
| 3  | Charlie     | NULL        |
| 4  | NULL        | David       |

Note :
       You’re not allowed to use ANY kind of JOIN.

*/


-- Create first table
CREATE TABLE TableA (
    ID INT,
    Name VARCHAR(50)
);

-- Insert data into TableA
INSERT INTO TableA (ID, Name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');


-- Create second table
CREATE TABLE TableB (
    ID INT,
    Name VARCHAR(50)
);

-- Insert data into TableB
INSERT INTO TableB (ID, Name) VALUES
(1, 'Alice'),
(2, 'Bobby'),
(4, 'David');




#Approach1

SELECT ID, Name
FROM TableA
WHERE (ID, Name) NOT IN (SELECT ID, Name FROM TableB)

UNION

SELECT ID, Name
FROM TableB
WHERE (ID, Name) NOT IN (SELECT ID, Name FROM TableA);



#Approach2

(
    SELECT ID, Name FROM TableA
    EXCEPT
    SELECT ID, Name FROM TableB
)
UNION
(
    SELECT ID, Name FROM TableB
    EXCEPT
    SELECT ID, Name FROM TableA
);



/* Using join */

SELECT t1.ID, t1.Name, t2.ID AS ID2, t2.Name AS Name2
FROM TableA t1
FULL OUTER JOIN TableB t2
    ON t1.ID = t2.ID AND t1.Name = t2.Name
WHERE t1.ID IS NULL 
   OR t2.ID IS NULL;
