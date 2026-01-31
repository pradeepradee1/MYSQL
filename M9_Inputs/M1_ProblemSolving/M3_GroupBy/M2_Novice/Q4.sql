/* CUBE → All combinations */

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



SELECT 
    department, 
    gender, 
    SUM(salary)
FROM 
    employees
GROUP BY CUBE(department, gender);



/*

Output 

| department | gender | total_salary |
| ---------- | ------ | ------------ |
| HR         | Female | 45000        |
| HR         | Male   | 40000        |
| IT         | Female | 50000        |
| IT         | Male   | 60000        |
| Sales      | Female | 52000        |
| Sales      | Male   | 55000        |
| HR         | NULL   | 85000        |
| IT         | NULL   | 110000       |
| Sales      | NULL   | 107000       |
| NULL       | Female | 147000       |
| NULL       | Male   | 155000       |
| NULL       | NULL   | 302000       |


*/
