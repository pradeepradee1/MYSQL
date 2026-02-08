/*
Find Employees Whose Manager Left the Company 

Input: 

Employees table:
+-------------+-----------+------------+--------+
| employee_id | name        | manager_id | salary |
+-------------+-----------+------------+--------+
| 3           | Mila        | 9          | 60301 |
| 12          | Antonella   | null       | 31000 |
| 13          | Emery       | null       | 67084 |
| 1           | Kalel       | 11         | 21241 |
| 9           | Mikaela     | null       | 50937 |
| 11          | Joziah      | 6          | 28485 |
+-------------+-----------+------------+--------+

Note : 

Report to a manager who has left the company
Meaning: manager_id exists but no matching employee_id


Output: 
+-------------+
| employee_id |
+-------------+
| 11 |
+-------------+


*/

/*

CREATE TABLE Employees_2 (
    employee_id INT,
    name VARCHAR(50),
    manager_id INT,
    salary INT
);


INSERT INTO Employees_2 (employee_id, name, manager_id, salary) VALUES
(3, 'Mila', 9, 60301),
(12, 'Antonella', NULL, 31000),
(13, 'Emery', NULL, 67084),
(1, 'Kalel', 11, 21241),
(9, 'Mikaela', NULL, 50937),
(11, 'Joziah', 6, 28485);


*/

SELECT e.employee_id
FROM Employees_2 e
LEFT JOIN Employees_2 m
    ON e.manager_id = m.employee_id
WHERE e.manager_id IS NOT NULL
  AND m.employee_id IS NULL;
