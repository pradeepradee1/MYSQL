/*

How would you generate the mirrored sequence using SQL?

The ID column becomes crucial to preserve ordering and construct the palindrome correctly.

𝐂𝐡𝐚𝐥𝐥𝐞𝐧𝐠𝐞 𝐟𝐨𝐫 𝐲𝐨𝐮
        Can you solve this WITHOUT using the ID column?

Input :

| id | ch |
| -- | -- |
| 1  | a  |
| 2  | b  |
| 3  | c  |
| 4  | d  |


Output :

| ch |
| -- |
| a  |
| b  |
| c  |
| d  |
| d  |
| c  |
| b  |
| a  |


*/

CREATE or replace TABLE letters ( id INT, ch CHAR(1) )

Insert data INSERT INTO letters (id, ch) 
VALUES (1, 'a'), (2, 'b'), (3, 'c'), (4, 'd');

/*

Solution WITH using ID (easy way)

*/

SELECT ch
FROM letters
ORDER BY id

UNION ALL

SELECT ch
FROM letters
ORDER BY id DESC;

/*

Challenge: WITHOUT using ID

*/

WITH ordered AS (
    SELECT ch,
           ROW_NUMBER() OVER () AS rn
    FROM letters
)
SELECT ch
FROM ordered

UNION ALL

SELECT ch
FROM ordered
ORDER BY rn DESC;