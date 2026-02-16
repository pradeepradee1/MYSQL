/*

From a watch_history table, find content where more than 50% of viewers watched less than 20% of the 
total content duration.

*/  
/*
CREATE TABLE watch_history (
    user_id INT,
    content_id INT,
    watch_time FLOAT,       -- in seconds or minutes watched
    total_duration FLOAT    -- total length of the content
);

INSERT INTO watch_history (user_id, content_id, watch_time, total_duration) VALUES
-- Content 1: 4 users, 3 watched less than 20%
(1, 1, 10, 100),   -- 10% watched
(2, 1, 15, 100),   -- 15% watched
(3, 1, 18, 100),   -- 18% watched
(4, 1, 90, 100),   -- 90% watched

-- Content 2: 4 users, only 1 watched less than 20%
(1, 2, 90, 100),   -- 90%
(2, 2, 80, 100),   -- 80%
(3, 2, 70, 100),   -- 70%
(4, 2, 10, 100),   -- 10%

-- Content 3: 3 users, all watched very little (<20%)
(1, 3, 5, 100),    -- 5%
(2, 3, 10, 100),   -- 10%
(3, 3, 15, 100);   -- 15%

*/


SELECT content_id
FROM (
    SELECT 
        content_id,
        COUNT(*) AS total_viewers,
        SUM(CASE WHEN watch_time < 0.2 * total_duration THEN 1 ELSE 0 END) AS drop_off_count
    FROM watch_history
    GROUP BY content_id
) AS sub
WHERE drop_off_count > 0.5 * total_viewers;



