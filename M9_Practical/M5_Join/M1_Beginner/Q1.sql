/*
Questions :

What is Output in INNER / LEFT / RIGHT / FULL OUTER join ?


*/


CREATE or REPLACE TABLE temp1 (
    colA TINYINT(4) DEFAULT NULL
) 

INSERT INTO temp1 (colA) 
VALUES
(1),
(2),
(1),
(5),
(NULL),
(NULL);



select * from temp1;


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

CREATE or REPLACE TABLE temp2 (
    colB TINYINT(4) DEFAULT NULL
) 

INSERT INTO temp2 (colB) 
VALUES
(NULL),
(2),
(5),
(5);


SELECT * FROM temp2;

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
