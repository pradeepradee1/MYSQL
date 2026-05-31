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


SELECT 
    a.user_id AS user1,
    b.user_id AS user2,
    COUNT(*) AS common_followers
FROM followers a
	JOIN followers b ON a.follower_id = b.follower_id AND a.user_id < b.user_id
GROUP BY a.user_id, b.user_id
ORDER BY common_followers DESC
LIMIT 1;
