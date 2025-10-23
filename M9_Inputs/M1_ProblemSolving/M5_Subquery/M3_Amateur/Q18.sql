/*

Calculate the year-over-year growth in total ad impressions

𝐏𝐫𝐨𝐛𝐥𝐞𝐦 𝐒𝐭𝐚𝐭𝐞𝐦𝐞𝐧𝐭
Calculate the year-over-year growth in total ad impressions for each category,
taking into account regional differences, and apply a threshold filter to only include categories that had more than 100,000 
total impressions in both years. 
Also, include the percentage growth in impressions for each region.

*/

/*
CREATE TABLE ad_impressions (
    ad_id INT,
    category VARCHAR(50),
    region VARCHAR(50),
    impressions INT,
    impression_date DATE
);


INSERT INTO ad_impressions (ad_id, category, region, impressions, impression_date) VALUES
-- Electronics category
(1, 'Electronics', 'North', 60000, '2024-01-10'),
(2, 'Electronics', 'North', 70000, '2025-01-15'),
(3, 'Electronics', 'South', 50000, '2024-02-01'),
(4, 'Electronics', 'South', 60000, '2025-02-10'),

-- Fashion category
(5, 'Fashion', 'North', 40000, '2024-03-05'),
(6, 'Fashion', 'North', 45000, '2025-03-10'),
(7, 'Fashion', 'South', 30000, '2024-04-01'),
(8, 'Fashion', 'South', 35000, '2025-04-15'),

-- Food category
(9, 'Food', 'North', 120000, '2024-05-10'),
(10, 'Food', 'North', 130000, '2025-05-15'),
(11, 'Food', 'South', 110000, '2024-06-01'),
(12, 'Food', 'South', 125000, '2025-06-10');

*/

WITH yearly_impressions AS (
    SELECT
        category,
        region,
        YEAR(impression_date) AS year,
        SUM(impressions) AS total_impressions
    FROM ad_impressions
    GROUP BY category, region, YEAR(impression_date)
)
SELECT
    curr.category,
    curr.region,
    prev.total_impressions AS prev_year_impressions,
    curr.total_impressions AS curr_year_impressions,
    ROUND((curr.total_impressions - prev.total_impressions) / prev.total_impressions * 100, 2) AS pct_growth
FROM yearly_impressions curr
JOIN yearly_impressions prev
    ON curr.category = prev.category
   AND curr.region = prev.region
   AND curr.year = prev.year + 1
WHERE curr.total_impressions > 100000
  AND prev.total_impressions > 100000
ORDER BY curr.category, curr.region;
