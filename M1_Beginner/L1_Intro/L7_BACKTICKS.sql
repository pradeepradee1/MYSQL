/*

Backticks are mainly used to prevent an error called "MySQL reserved word"

*/
SELECT student_name, AVG(test_score) FROM student GROUP BY group
SELECT student_name, AVG(test_score) FROM student GROUP BY `group`
SELECT `users`.`username`, `groups`.`group` FROM `users`
select `student_name`, AVG(`test_score`) from `student` group by `group`
