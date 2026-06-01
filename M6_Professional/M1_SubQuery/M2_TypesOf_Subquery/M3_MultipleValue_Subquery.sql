/*
Multiple value Subquery :
                        Returns multiple row
                        Used with IN, EXISTS , ALL, ANY 
*/

/*
Note : 
        EXISTS is conditional operator
*/

SELECT name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'India');

