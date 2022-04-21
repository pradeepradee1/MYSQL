/*
Variable
*/

use mydb;

#Declaring a Variable Using SET
SET @var_string = 'my_var';
SET @var_num = '2';
SET @var_date = '2015-07-20';

select @var_string,@var_num,@var_date

#Declaring a Variable Using Select Statement
SET @row_no = 0;

select @row_no1 := 100

select @row_no,@row_no1

select @row_no1 := @row_no1+22


