
/*

#Get Second Max Salary

*/


CREATE OR REPLACE TABLE employee_salary (
    id INT,
    salary INT
);

INSERT INTO employee_salary (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);

select * from employee_salary


/*

Output as

SecondMaxSalary
	200

*/

SELECT salary
FROM employee_salary
ORDER BY salary DESC
LIMIT 1,1;