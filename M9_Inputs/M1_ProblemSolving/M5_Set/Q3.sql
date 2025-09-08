/*

We are given 2 input tables with ID and Name columns in both input tables. 
➡️Our Task: Our task is to get the mismatched records from both tables and print them in the output.


| ID | Name    |
| -- | ------- |
| 1  | Alice   |
| 2  | Bob     |
| 3  | Charlie |



| ID | Name  |
| -- | ----- |
| 1  | Alice |
| 2  | Bobby |
| 4  | David |


Note :
       🚫 ❌ You’re not allowed to use ANY kind of JOIN.

*/


-- Records in table1 but not in table2
SELECT ID, Name, 'From_Table1' AS Source
FROM table1
WHERE (ID, Name) NOT IN (
    SELECT ID, Name FROM table2
)

UNION

-- Records in table2 but not in table1
SELECT ID, Name, 'From_Table2' AS Source
FROM table2
WHERE (ID, Name) NOT IN (
    SELECT ID, Name FROM table1
);


/* Using join */

SELECT t1.ID, t1.Name, t2.ID AS ID2, t2.Name AS Name2
FROM table1 t1
FULL OUTER JOIN table2 t2
    ON t1.ID = t2.ID AND t1.Name = t2.Name
WHERE t1.ID IS NULL 
   OR t2.ID IS NULL;
