/*

find employees who:
*) Earn less than $30,000
*) Report to a manager who has left the company
*) When a manager leaves, their record is deleted — but their employee_id may 
still be referenced in manager_id.

Find
1) Earn less than 30000
2) Report to a manager who no longer exists in the table

*/


CREATE or replace TABLE Employees2 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    salary INT
);



INSERT INTO Employees2 (employee_id, name, manager_id, salary) 
VALUES
(3, 'Mila', 9, 60301),
(12, 'Antonella', NULL, 31000),
(13, 'Emery', NULL, 67084),
(1, 'Kalel', 11, 21241),
(9, 'Mikaela', NULL, 50937),
(11, 'Joziah', 6, 28485);

/*
Input :

| employee_id | name      | manager_id | salary |
| ----------- | --------- | ---------- | ------ |
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | NULL       | 31000  |
| 13          | Emery     | NULL       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | NULL       | 50937  |
| 11          | Joziah    | 6          | 28485  |

Excepected Output :

| employee_id | name   | manager_id | salary |
| ----------- | ------ | ---------- | ------ |
| 1           | Kalel  | 11         | 21241  |
| 11          | Joziah | 6          | 28485  |


*/




/* 
Solution 1: Subquery 


We need :
salary < 30000
manager_id IS NOT NULL
That manager_id does NOT exist in employee_id

*/

SELECT 
    e.*
FROM 
    Employees2 e
WHERE e.salary < 30000
    AND e.manager_id IS NOT NULL
    AND NOT EXISTS (SELECT * FROM Employees2 m WHERE m.employee_id = e.manager_id)
