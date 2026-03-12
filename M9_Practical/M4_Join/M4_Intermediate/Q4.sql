/*


📥 𝗜𝗻𝗽𝘂𝘁
num
1
2
3

📤 𝗘𝘅𝗽𝗲𝗰𝘁𝗲𝗱 𝗢𝘂𝘁𝗽𝘂𝘁
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



SELECT n.num
FROM numbers n
JOIN (
    SELECT 1 AS x
    UNION ALL SELECT 2
    UNION ALL SELECT 3
) t
ON t.x <= n.num
ORDER BY n.num;