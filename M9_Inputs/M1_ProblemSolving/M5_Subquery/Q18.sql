/*

Calculate the year-over-year growth in total ad impressions

𝐏𝐫𝐨𝐛𝐥𝐞𝐦 𝐒𝐭𝐚𝐭𝐞𝐦𝐞𝐧𝐭
Calculate the year-over-year growth in total ad impressions for each category,
taking into account regional differences, and apply a threshold filter to only include categories that had more than 100,000 total impressions in both years. 
Also, include the percentage growth in impressions for each region.

*/

CREATE TABLE ad_impressions (
 ad_id INT,
 category VARCHAR(50),
 impressions INT,
 region VARCHAR(50),
 year INT
);

INSERT INTO ad_impressions (ad_id, category, impressions, region, year) VALUES
(1, 'Tech', 50000, 'North', 2023),
(2, 'Tech', 60000, 'South', 2023),
(3, 'Tech', 70000, 'North', 2024),
(4, 'Health', 120000, 'South', 2023),
(5, 'Health', 140000, 'North', 2024),
(6, 'Health', 100000, 'South', 2024),
(7, 'Gaming', 20000, 'West', 2023),
(8, 'Gaming', 25000, 'West', 2024);



WITH YearlyImpressions AS (
 SELECT category,
 region,
 SUM(CASE WHEN year = 2024 THEN impressions ELSE 0 END) AS impressions_2024,
 SUM(CASE WHEN year = 2023 THEN impressions ELSE 0 END) AS impressions_2023
 FROM ad_impressions
 GROUP BY category, region
),
CategoryGrowth AS (
 SELECT category,
 SUM(impressions_2024) AS total_impressions_2024,
 SUM(impressions_2023) AS total_impressions_2023,
 SUM(impressions_2024) - SUM(impressions_2023) AS total_impressions_growth,
 (SUM(impressions_2024) - SUM(impressions_2023)) / NULLIF(SUM(impressions_2023), 0) * 100 AS yoy_growth
 FROM YearlyImpressions
 GROUP BY category
 HAVING SUM(impressions_2024) > 100000 AND SUM(impressions_2023) > 100000
)
SELECT y.category,
 y.region,
 y.impressions_2024,
 y.impressions_2023,
 g.total_impressions_growth,
 g.yoy_growth
FROM YearlyImpressions y
JOIN CategoryGrowth g ON y.category = g.category
ORDER BY g.yoy_growth DESC;
