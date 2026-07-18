/*
Multiple Column and multiple values Subquery :
                        It Returns Multiple Column and multiple values 
                        Used with tuple comparison and  IN, EXISTS , ALL, ANY
*/

SELECT *
FROM employees
WHERE (department_id, job_id) IN (SELECT department_id, job_id FROM job_history);

