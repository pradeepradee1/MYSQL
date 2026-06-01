/*
<<<<<<< HEAD
Multiple value Subquery :
                        Returns multiple row
=======
Multiple Row Subquery :
                        Returns multiple values
>>>>>>> 165d0e6991187b6dee59699da38e29843c24ef6d
                        Used with IN, EXISTS , ALL, ANY 
*/

/*
Note : 
        EXISTS is conditional operator
*/

SELECT name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'India');

