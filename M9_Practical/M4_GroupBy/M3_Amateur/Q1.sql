/*

Questins :

Identify Active Users Based on Video Uploads and Interactions

*) The user has uploaded at least 5 videos.
*) At least 3 of those videos have more than 100 total interactions
    Total Interactions = Likes + Comments

*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------
/*

CREATE or replace TABLE videos (
    video_id INT,
    user_id INT,
    upload_date DATE,
    likes INT,
    comments INT
);

INSERT INTO videos (video_id, user_id, upload_date, likes, comments) VALUES
(1, 1, '2025-01-01', 50, 20),
(2, 1, '2025-01-02', 120, 30),
(3, 1, '2025-01-03', 200, 50),
(4, 1, '2025-01-04', 150, 60),
(5, 1, '2025-01-05', 80, 10),
(6, 1, '2025-01-06', 130, 40),
(7, 2, '2025-01-01', 60, 20),
(8, 2, '2025-01-02', 50, 10),
(9, 2, '2025-01-03', 150, 30),
(10, 2, '2025-01-04', 90, 15),
(11, 2, '2025-01-05', 200, 40),
(12, 3, '2025-01-01', 120, 50),
(13, 3, '2025-01-02', 130, 60),
(14, 3, '2025-01-03', 80, 20),
(15, 3, '2025-01-04', 150, 40),
(16, 3, '2025-01-05', 70, 10);



Input :

| video_id | user_id | upload_date | likes | comments |
| -------: | ------: | :---------: | ----: | -------: |
|        1 |       1 |  2025-01-01 |    50 |       20 |
|        2 |       1 |  2025-01-02 |   120 |       30 |
|        3 |       1 |  2025-01-03 |   200 |       50 |
|        4 |       1 |  2025-01-04 |   150 |       60 |
|        5 |       1 |  2025-01-05 |    80 |       10 |
|        6 |       1 |  2025-01-06 |   130 |       40 |
|        7 |       2 |  2025-01-01 |    60 |       20 |
|        8 |       2 |  2025-01-02 |    50 |       10 |
|        9 |       2 |  2025-01-03 |   150 |       30 |
|       10 |       2 |  2025-01-04 |    90 |       15 |
|       11 |       2 |  2025-01-05 |   200 |       40 |
|       12 |       3 |  2025-01-01 |   120 |       50 |
|       13 |       3 |  2025-01-02 |   130 |       60 |
|       14 |       3 |  2025-01-03 |    80 |       20 |
|       15 |       3 |  2025-01-04 |   150 |       40 |
|       16 |       3 |  2025-01-05 |    70 |       10 |



Output : 

| user_id | highly_interactive_videos |
| ------- | ------------------------- |
| 1       | 4                         |
| 3       | 3                         |



*/

SELECT 
    user_id,
    COUNT(CASE WHEN likes + comments > 100 THEN 1 END) 
        AS highly_interactive_videos
FROM videos
GROUP BY user_id
HAVING 
    COUNT(video_id) >= 5 AND COUNT(CASE WHEN likes + comments > 100 THEN 1 END) >= 3
ORDER BY highly_interactive_videos DESC;
