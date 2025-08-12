/* 

Returns rows from the left table where no match exists in the right table


*/


SELECT a.*
FROM tableA a
WHERE NOT EXISTS (
    SELECT 1
    FROM tableB b
    WHERE a.id = b.id
);



/*
| cust\_id | name  |
| -------- | ----- |
| 1        | Alice |
| 2        | Bob   |
| 3        | Carol |
| 4        | David |

| order\_id | cust\_id |
| --------- | -------- |
| 101       | 1        |
| 102       | 3        |
| 103       | 1        |


# Output 

| cust\_id | name  |
| -------- | ----- |
| 2        | Bob   |
| 4        | David |



*/
