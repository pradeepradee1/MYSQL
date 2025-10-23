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

/*
CREATE TABLE posts1 (
    post_id INT,
    user_name VARCHAR(50),
    post_text VARCHAR(255)
);

CREATE TABLE comments1 (
    comment_id INT,
    post_id INT,
    user_name VARCHAR(50),
    comment_text VARCHAR(255),
    comment_date DATE
);

-- Posts
INSERT INTO posts1 (post_id, user_name, post_text) VALUES
(1, 'Alice', 'Post about SQL'),
(2, 'Bob', 'Post about Python'),
(3, 'Charlie', 'Post about Data Science');

-- Comments
INSERT INTO comments1 (comment_id, post_id, user_name, comment_text, comment_date) VALUES
(1, 1, 'Bob', 'Nice post!', '2025-01-01'),
(2, 1, 'Charlie', 'Thanks for sharing', '2025-01-02'),
(3, 1, 'Bob', 'Very helpful', '2025-01-03'),
(4, 1, 'Alice', 'Glad you liked it', '2025-01-04'),   -- post owner, should be excluded
(5, 2, 'Alice', 'Great Python tips', '2025-01-05'),
(6, 2, 'Charlie', 'I love Python', '2025-01-06'),
(7, 2, 'Charlie', 'Another comment', '2025-01-07'),
(8, 3, 'Alice', 'Nice insights', '2025-01-08'),
(9, 3, 'Bob', 'Thanks for sharing', '2025-01-09'),
(10, 3, 'Alice', 'Another comment', '2025-01-10');

*/

WITH comment_counts AS (
    SELECT 
        c.post_id,
        c.user_name,
        COUNT(*) AS num_comments
    FROM comments1 c
    JOIN posts1 p ON c.post_id = p.post_id
    WHERE c.user_name != p.user_name   -- exclude post owner
    GROUP BY c.post_id, c.user_name
),
ranked_comments AS (
    SELECT
        post_id,
        user_name,
        num_comments,
        RANK() OVER (PARTITION BY post_id ORDER BY num_comments DESC) AS rnk
    FROM comment_counts
)
SELECT
    post_id,
    user_name AS top_commenter,
    num_comments
FROM ranked_comments
WHERE rnk = 1
ORDER BY post_id;
