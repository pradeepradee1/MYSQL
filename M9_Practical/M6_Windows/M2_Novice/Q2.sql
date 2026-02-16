/*

Given a table "employees" with columns (id, name, department, salary), find the top 3 highest paid employees in each department.

*/

CREATE TABLE employees3 ( 
 id INT, 
 name VARCHAR(50), 
 department VARCHAR(50), 
 salary INT 
); 
INSERT INTO employees3 VALUES (1, 'John', 'Sales', 60000); 
INSERT INTO employees3 VALUES (2, 'Jane', 'Sales', 55000); 
INSERT INTO employees3 VALUES (3, 'Bob', 'Marketing', 65000); 
INSERT INTO employees3 VALUES (4, 'Sue', 'Marketing', 70000); 
INSERT INTO employees3 VALUES (5, 'Mike', 'IT', 80000); 
INSERT INTO employees3 VALUES (6, 'Lisa', 'IT', 75000); 


SELECT id, name, department, salary 
FROM (SELECT *, RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank 
FROM employees3) AS ranked 
WHERE rank <= 3