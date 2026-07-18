/*
Single Column and Single value Subquery :
                    It Returns the Single Column and Single value ( single record )
                    Used with operators like =, >, <, >=, <= (Assignment and Relational operator)
*/


/*
    Find employees earning more than average salary
*/

SELECT name 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

