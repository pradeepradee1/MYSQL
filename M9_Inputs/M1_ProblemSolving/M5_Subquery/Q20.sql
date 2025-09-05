/*

You’re given two tables:
posts
post_id | user_name | post_text

comments
comment_id | post_id | user_name | comment_text | comment_date

Goal:
For each post, find the user who wrote the most comments — but exclude the post owner from counting.
If there’s a tie, return any one of the top commenters for that post.

*/

CREATE TABLE posts (
 post_id INT PRIMARY KEY,
 user_name VARCHAR(50),
 post_text VARCHAR(255)
);

INSERT INTO posts VALUES
(1, 'Gowtham', 'SQL romba powerful da'),
(2, 'Karthik', 'BigQuery enaku pidikkum');

CREATE TABLE comments (
 comment_id INT PRIMARY KEY,
 post_id INT,
 user_name VARCHAR(50),
 comment_text VARCHAR(255),
 comment_date DATE
);

INSERT INTO comments VALUES
(1, 1, 'Karthik', 'Semma post da!', '2024-06-01'),
(2, 1, 'Anbu', 'Nalla share panniruka', '2024-06-02'),
(3, 1, 'Karthik', 'Naanum agree', '2024-06-03'),
(4, 1, 'Gowtham', 'Thanks guys!', '2024-06-04'), -- should exclude
(5, 2, 'Gowtham', 'Interesting bro!', '2024-06-01'),
(6, 2, 'Anbu', 'Nalla article da', '2024-06-02'),
(7, 2, 'Anbu', 'Usefull ah iruku', '2024-06-03');




WITH filtered_comments AS (
 SELECT c.post_id, c.user_name
 FROM comments c
 JOIN posts p ON c.post_id = p.post_id
 WHERE c.user_name != p.user_name
),
comment_counts AS (
 SELECT post_id, user_name, COUNT(*) AS comment_count,
 RANK() OVER (PARTITION BY post_id ORDER BY COUNT(*) DESC) AS rnk
 FROM filtered_comments
 GROUP BY post_id, user_name
)
SELECT post_id, user_name AS top_commenter
FROM comment_counts
WHERE rnk = 1;



