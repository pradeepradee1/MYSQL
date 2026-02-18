/*
Multiple Column Subquery :
                        Returns more than one column
                        Used with tuple comparison and  IN, ANY, ALL, EXISTS
*/

SELECT *
FROM employees
WHERE (department_id, job_id) IN 
      (SELECT department_id, job_id FROM job_history);
