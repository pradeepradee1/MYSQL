/*
#Question : 
find all the pairs of users with maximum number of common folowers


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



for ex : 
		 1 and 2 user have two common (3 and 4)

		 1 and 7 user have three common (3,4,5)

		 2 and 7 user have two common (3,4)

So , Ans is 1 and 7

Sample Input :

| user_id | follower_id |
| ------- | ----------- |
| 1       | 3           |
| 2       | 3           |
| 7       | 3           |
| 1       | 4           |
| 2       | 4           |
| 7       | 4           |
| 1       | 5           |
| 2       | 6           |
| 7       | 5           |
| 8       | 4           |
| 8       | 3           |
| 8       | 6           |
| 1       | 9           |
| 7       | 9           |

Output :

| user1 | user2 | common_count |
| ----- | ----- | ------------ |
| 1     | 7     | 3            |


*/


WITH common_followers AS
(
    SELECT
        f1.user_id AS user1,
        f2.user_id AS user2,
        COUNT(*) AS common_followers
    FROM followers f1 JOIN followers f2 ON f1.follower_id = f2.follower_id AND f1.user_id < f2.user_id
    GROUP BY f1.user_id,f2.user_id
),
max_common AS
(
    SELECT MAX(common_followers) AS max_cnt
    FROM common_followers
)
SELECT
    c.user1,
    c.user2,
    c.common_followers
FROM common_followers c
JOIN max_common m
ON c.common_followers = m.max_cnt;
