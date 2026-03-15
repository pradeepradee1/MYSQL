/*
Question : Find the Mutual followers 

which means:
A follower who follows more than one user

CREATE or REPLACE TABLE followers (
    user_id INT,
    follower_id INT
);

INSERT INTO followers (user_id, follower_id) 
VALUES
(1,3),
(2,3),
(7,3),
(1,4),
(2,4),
(7,4),
(1,5),
(2,6),
(7,5),
(8,4),
(8,3),
(8,6),
(1,9),
(7,9);



*/


SELECT 
    follower_id
FROM 
    followers
GROUP BY follower_id
HAVING COUNT(DISTINCT user_id) > 1;