/*

Identify Active Users Based on Video Uploads and Interactions


You’re working as a data analyst at TikTok. Your task is to identify users who are "highly active" based on the following 
criteria:

Users must have uploaded at least 5 videos.
At least 3 of these videos must have more than 100 interactions (likes + comments).

You need to return a list of user IDs and the count of their "highly interactive" videos, sorted by the count in descending order.

*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------
# Schema
/*

CREATE TABLE videos (
    video_id INT,
    user_id INT,
    upload_date DATE,
    likes INT,
    comments INT
);

INSERT INTO videos (video_id, user_id, upload_date, likes, comments) VALUES
-- User 1: 6 videos, 4 with interactions > 100
(1, 1, '2025-01-01', 50, 20),
(2, 1, '2025-01-02', 120, 30),
(3, 1, '2025-01-03', 200, 50),
(4, 1, '2025-01-04', 150, 60),
(5, 1, '2025-01-05', 80, 10),
(6, 1, '2025-01-06', 130, 40),

-- User 2: 5 videos, only 2 with interactions > 100 (should not qualify)
(7, 2, '2025-01-01', 60, 20),
(8, 2, '2025-01-02', 50, 10),
(9, 2, '2025-01-03', 150, 30),
(10, 2, '2025-01-04', 90, 15),
(11, 2, '2025-01-05', 200, 40),

-- User 3: 5 videos, 3 with interactions > 100 (should qualify)
(12, 3, '2025-01-01', 120, 50),
(13, 3, '2025-01-02', 130, 60),
(14, 3, '2025-01-03', 80, 20),
(15, 3, '2025-01-04', 150, 40),
(16, 3, '2025-01-05', 70, 10);
*/

SELECT 
    user_id,
    COUNT(*) AS highly_interactive_videos
FROM videos
WHERE (likes + comments) > 100
GROUP BY user_id
HAVING COUNT(*) >= 3
   AND (SELECT COUNT(*) FROM videos v2 WHERE v2.user_id = videos.user_id) >= 5
ORDER BY highly_interactive_videos DESC;
