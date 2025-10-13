/*

The company wants to measure Click Through Rate (CTR) for each advertisement campaign.

CTR (Click Through Rate) measures how often people click on an ad after seeing it.

CTR = ( Number of Clicks / Number of Impressions ) × 100
	​

| ad_id | campaign_id | impressions | clicks | date       |
| ----- | ----------- | ----------- | ------ | ---------- |
| 1     | C001        | 1000        | 50     | 2025-10-01 |
| 2     | C001        | 2000        | 120    | 2025-10-02 |
| 3     | C002        | 1500        | 30     | 2025-10-01 |
| 4     | C002        | 2500        | 75     | 2025-10-02 |
| 5     | C003        | 800         | 20     | 2025-10-01 |




OP

| campaign_id | total_clicks | total_impressions | ctr_percentage |
| ----------- | ------------ | ----------------- | -------------- |
| C001        | 170          | 3000              | 5.67           |
| C002        | 105          | 4000              | 2.63           |
| C003        | 20           | 800               | 2.50           |

*/

SELECT
    campaign_id,
    SUM(clicks) AS total_clicks,
    SUM(impressions) AS total_impressions,
    ROUND(SUM(clicks) * 100.0 / SUM(impressions), 2) AS ctr_percentage
FROM ad_performance
GROUP BY campaign_id
ORDER BY ctr_percentage DESC;

