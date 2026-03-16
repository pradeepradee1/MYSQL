/*


𝗜𝗻𝗽𝘂𝘁
num
1
2
3

𝗘𝘅𝗽𝗲𝗰𝘁𝗲𝗱 𝗢𝘂𝘁𝗽𝘂𝘁
1
2
2
3
3
3

*/


CREATE or replace TABLE numbers (
    num INT
);

INSERT INTO numbers VALUES
(1),
(2),
(3);



WITH RECURSIVE cte AS (
    SELECT num, 1 AS cnt
    FROM numbers
    
    UNION ALL
    
    SELECT num, cnt + 1
    FROM cte
    WHERE cnt < num
)
SELECT num
FROM cte
ORDER BY num;