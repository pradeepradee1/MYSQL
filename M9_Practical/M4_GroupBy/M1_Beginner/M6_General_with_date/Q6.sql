/*
Questions : 

Find the user and number of the days between each user's first and last post.

*/



CREATE or replace TABLE user_posts (
    post_id INT,
    user_id INT,
    post_date DATE
);


INSERT INTO user_posts (post_id, user_id, post_date) VALUES
(1, 1, '2025-01-01'),
(2, 1, '2025-01-05'),
(3, 1, '2025-01-10'),
(4, 2, '2025-02-01'),
(5, 2, '2025-02-03'),
(6, 3, '2025-03-01'),
(7, 3, '2025-03-05'),
(8, 3, '2025-03-10'),
(9, 3, '2025-03-15');


SELECT 
    user_id,
    DATEDIFF(MAX(post_date), MIN(post_date)) AS days_between_first_last
FROM 
    user_posts
GROUP BY 
    user_id;

