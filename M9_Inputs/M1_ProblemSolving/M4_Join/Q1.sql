select * from problemsolving2_table1;

/*

OP
-------------
NULL
NULL
1
1
2
5
-------------

*/

select * from problemsolving2_table2;

/*

OP
--------------
NULL
2
5
5
-------------

*/


#Question 1 : 

/*
What is OP for inner join ?

OP :

| a.col | b.col |
| ----- | ----- |
| 2     | 2     |
| 5     | 5     |
| 5     | 5     |



*/

#Question 2 :
	
/*
What is OP for Left join ?

OP :

| a.col | b.col |
| ----- | ----- |
| NULL  | NULL  |
| NULL  | NULL  |
| 1     | NULL  |
| 1     | NULL  |
| 2     | 2     |
| 5     | 5     |
| 5     | 5     |



*/

#Question 3 : 

/*
# What is OP for right join ?

OP :

| a.col | b.col |
| ----- | ----- |
| 2     | 2     |
| 5     | 5     |
| 5     | 5     |
| NULL  | NULL  |

*/


#Question 4 :

/*
# What is OP for full outer join ?


OP : 

| table1_col | table2_col |
| ---------- | ---------- |
| NULL       | NULL       |
| NULL       | NULL       |
| 1          | NULL       |
| 1          | NULL       |
| 2          | 2          |
| 5          | 5          |
| 5          | 5          |


*/
