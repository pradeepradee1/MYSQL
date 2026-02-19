/*
Multiple Row Subquery :
                        Returns multiple row
                        Used with IN, ANY, ALL, EXISTS  
*/

/*
Note : 
        EXISTS is conditional operator
*/

SELECT name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'India');

