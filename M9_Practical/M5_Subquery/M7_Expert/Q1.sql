/*


𝐏𝐫𝐨𝐛𝐥𝐞𝐦 :
            Calculate the year-over-year (YoY) growth in total ad impressions for each category,
taking into account regional differences, and 
apply a threshold filter to 
only include categories that had more than 100,000 
total impressions in both years. 
Also, include the percentage growth in impressions for each region.


*/

/*

create or replace TABLE ad_impressions (
    ad_id INT,
    category VARCHAR(50),
    region VARCHAR(50),
    impressions INT,
    impression_date DATE
);


INSERT INTO ad_impressions (ad_id, category, region, impressions, impression_date) VALUES
(1, 'Electronics', 'North', 60000, '2024-01-10'),
(2, 'Electronics', 'North', 70000, '2025-01-15'),
(3, 'Electronics', 'South', 50000, '2024-02-01'),
(4, 'Electronics', 'South', 60000, '2025-02-10'),
(5, 'Fashion', 'North', 40000, '2024-03-05'),
(6, 'Fashion', 'North', 45000, '2025-03-10'),
(7, 'Fashion', 'South', 30000, '2024-04-01'),
(8, 'Fashion', 'South', 35000, '2025-04-15'),
(9, 'Food', 'North', 120000, '2024-05-10'),
(10, 'Food', 'North', 130000, '2025-05-15'),
(11, 'Food', 'South', 110000, '2024-06-01'),
(12, 'Food', 'South', 125000, '2025-06-10');


*/

WITH yearly_impressions AS (
    SELECT 
        category,
        region,
        EXTRACT(YEAR FROM impression_date) AS year,
        SUM(impressions) AS total_impressions
    FROM ad_impressions
    GROUP BY category, region, EXTRACT(YEAR FROM impression_date)
),

category_totals AS (
    SELECT 
        category,
        year,
        SUM(total_impressions) AS category_total
    FROM yearly_impressions
    GROUP BY category, year
    HAVING SUM(total_impressions) > 100000
)

SELECT 
    y1.category,
    y1.region,
    y1.total_impressions AS impressions_2024,
    y2.total_impressions AS impressions_2025,
    
    ROUND(
        (y2.total_impressions - y1.total_impressions) * 100.0 
        / y1.total_impressions,
        2
    ) AS growth_percentage

FROM yearly_impressions y1
JOIN yearly_impressions y2
    ON y1.category = y2.category
    AND y1.region = y2.region
    AND y1.year = 2024
    AND y2.year = 2025

JOIN category_totals c1
    ON y1.category = c1.category AND c1.year = 2024

JOIN category_totals c2
    ON y2.category = c2.category AND c2.year = 2025

ORDER BY y1.category, y1.region;