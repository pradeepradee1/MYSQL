/*

Find the employees who earn more than the average salary of their department and 
have at least two subordinates reporting 
directly to them.

*/

/*

CREATE or replace TABLE Employees4 (
 emp_id INT,
 emp_name VARCHAR(100),
 salary INT,
 department_id INT,
 manager_id INT
);

INSERT INTO Employees4 VALUES
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

*/


SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    e.department_id,
    COUNT(sub.emp_id) AS num_subordinates
FROM Employees4 e
LEFT JOIN Employees4 sub
    ON sub.manager_id = e.emp_id
GROUP BY e.emp_id, e.emp_name, e.salary, e.department_id
HAVING e.salary > (
        SELECT AVG(salary)
        FROM Employees4
        WHERE department_id = e.department_id
    )
    AND COUNT(sub.emp_id) >= 2
ORDER BY e.department_id, e.salary DESC;

--(OR)

WITH dept_avg AS (
    SELECT department_id, AVG(salary) avg_salary
    FROM Employees4
    GROUP BY department_id
)

SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    e.department_id,
    COUNT(sub.emp_id) AS num_subordinates
FROM Employees4 e
LEFT JOIN Employees4 sub
    ON sub.manager_id = e.emp_id
JOIN dept_avg d
    ON e.department_id = d.department_id
GROUP BY e.emp_id, e.emp_name, e.salary, e.department_id, d.avg_salary
HAVING e.salary > d.avg_salary
   AND COUNT(sub.emp_id) >= 2;