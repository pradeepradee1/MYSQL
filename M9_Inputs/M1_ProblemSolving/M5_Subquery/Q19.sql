/*

 Find the employees who earn more than the average salary of their department and have at least two subordinates reporting directly to them.

*/

CREATE TABLE Employees (
 emp_id INT,
 emp_name VARCHAR(100),
 salary INT,
 department_id INT,
 manager_id INT
);

INSERT INTO Employees VALUES
(1, 'Alice', 120000, 10, NULL),
(2, 'Bob', 90000, 10, 1),
(3, 'Charlie', 95000, 10, 1),
(4, 'David', 60000, 20, 2),
(5, 'Eve', 70000, 20, 2),
(6, 'Frank', 85000, 10, 1),
(7, 'Grace', 105000, 30, NULL),
(8, 'Heidi', 95000, 30, 7),
(9, 'Ivan', 92000, 10, 3),
(10, 'Judy', 88000, 10, 3);


SELECT e.emp_id, e.emp_name
FROM Employees e
JOIN (
 SELECT department_id, AVG(salary) AS avg_salary
 FROM Employees
 GROUP BY department_id
) d ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary
 AND (
 SELECT COUNT(*) 
 FROM Employees sub 
 WHERE sub.manager_id = e.emp_id
 ) >= 2;

