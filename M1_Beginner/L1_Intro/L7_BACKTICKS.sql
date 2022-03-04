/*

Backticks are mainly used to prevent an error called "MySQL reserved word"

*/
use mydb;

SELECT * from student s 

# Error
SELECT student_id , AVG(price) FROM student GROUP BY group 

SELECT student_id , AVG(price) FROM student GROUP BY `group`

select `student_id`, AVG(`price`) from `student` group by `group`




