/*

Use Case: From a watch_history table, find content where more than 50% of viewers watched less than 20% of the total content duration.

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
