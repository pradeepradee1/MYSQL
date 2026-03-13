/*
What is ROLLUP ? (Advanced)
*/


CREATE or replace TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    gender VARCHAR(10),
    salary INT
);


INSERT INTO employees VALUES
(1, 'Alice',   'IT',    'Female', 50000),
(2, 'Bob',     'IT',    'Male',   60000),
(3, 'Charlie', 'HR',    'Male',   40000),
(4, 'Diana',   'HR',    'Female', 45000),
(5, 'Evan',    'Sales', 'Male',   55000),
(6, 'Fiona',   'Sales', 'Female', 52000);


/*

Input

| emp_id | emp_name | department | gender | salary |
| ------ | -------- | ---------- | ------ | ------ |
| 1      | Alice    | IT         | Female | 50000  |
| 2      | Bob      | IT         | Male   | 60000  |
| 3      | Charlie  | HR         | Male   | 40000  |
| 4      | Diana    | HR         | Female | 45000  |
| 5      | Evan     | Sales      | Male   | 55000  |
| 6      | Fiona    | Sales      | Female | 52000  |


*/




/* 

ROLLUP → Subtotals 

What ROLLUP Does ?

ROLLUP adds:

✔ Subtotal per department
✔ Grand total (all departments)

*/

SELECT
    department, 
    SUM(salary)
FROM 
    employees
GROUP BY ROLLUP(department);



/*

Output

| department | total_salary |
| ---------- | ------------ |
| HR         | 85000        |
| IT         | 110000       |
| Sales      | 107000       |
| NULL       | 302000       |


Meaning

| Row   | Meaning               |
| ----- | --------------------- |
| HR    | HR total              |
| IT    | IT total              |
| Sales | Sales total           |
| NULL  | All departments total |



*/

/* ROLLUP With Multiple Columns */


SELECT 
    department,
    gender,
    SUM(salary) AS total_salary
FROM employees
GROUP BY ROLLUP(department, gender);

/*

| department | gender | total_salary |
| ---------- | ------ | ------------ |
| HR         | Female | 45000        |
| HR         | Male   | 40000        |
| HR         | NULL   | 85000        |
| IT         | Female | 50000        |
| IT         | Male   | 60000        |
| IT         | NULL   | 110000       |
| Sales      | Female | 52000        |
| Sales      | Male   | 55000        |
| Sales      | NULL   | 107000       |
| NULL       | NULL   | 302000       |

*/


