/*
Single Column and Multiple value Subquery :
                        It Returns Single Column and Multiple value (multiple record )
                        Used with IN, EXISTS , ALL, ANY 
*/

/*
Note : 
        EXISTS is conditional operator
*/

SELECT name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'India');

