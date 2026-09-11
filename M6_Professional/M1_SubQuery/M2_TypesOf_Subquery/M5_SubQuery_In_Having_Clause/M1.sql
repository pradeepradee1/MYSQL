        
        
SELECT 
    department_id 
FROM 
    employees
GROUP BY department_id
HAVING salary > (SELECT AVG(salary) FROM employees);
