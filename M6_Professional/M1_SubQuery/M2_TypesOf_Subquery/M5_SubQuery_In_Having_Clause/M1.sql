        
        
SELECT 
    department_id 
FROM 
    employees
GROUP BY department_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);
