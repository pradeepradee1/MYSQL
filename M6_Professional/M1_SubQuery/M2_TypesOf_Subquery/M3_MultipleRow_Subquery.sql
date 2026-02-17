/*
Multiple Row Subquery :
                        Returns multiple row
                        Used with IN, ANY, ALL, EXISTS  
*/


SELECT name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'India');
