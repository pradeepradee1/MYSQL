/*

Find Employees Whose Manager Left the Company 

From an Employees table, find employees who:
Earn less than $30,000
Report to a manager who has left the company
When a manager leaves, their record is deleted — but their employee_id may still be referenced in manager_id.

*/


CREATE TABLE Employees2 (
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
Solution 1: Self LEFT JOIN
*/

SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id
WHERE e.salary < 30000
 AND m.employee_id IS NULL
 AND e.manager_id IS NOT NULL
ORDER BY e.employee_id;



/* 
Solution 2: Subquery with NOT IN 
*/

SELECT employee_id
FROM Employees
WHERE salary < 30000 AND manager_id NOT IN 
 (SELECT DISTINCT employee_id FROM Employees)
ORDER BY employee_id;

