/*

Given a table "employees" with columns (id, name, department, salary), find the top 3 highest paid employees in each department.

*/

CREATE TABLE employees ( 
 id INT, 
 name VARCHAR(50), 
 department VARCHAR(50), 
 salary INT 
); 
INSERT INTO employees VALUES (1, 'John', 'Sales', 60000); 
INSERT INTO employees VALUES (2, 'Jane', 'Sales', 55000); 
INSERT INTO employees VALUES (3, 'Bob', 'Marketing', 65000); 
INSERT INTO employees VALUES (4, 'Sue', 'Marketing', 70000); 
INSERT INTO employees VALUES (5, 'Mike', 'IT', 80000); 
INSERT INTO employees VALUES (6, 'Lisa', 'IT', 75000); 


SELECT id, name, department, salary 
FROM (SELECT *, RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank 
FROM employees) AS ranked 
WHERE rank <= 3; 
