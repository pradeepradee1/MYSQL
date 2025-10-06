/* 
Note : Please visit how to calulte the percentage in Data Science Repo.
*/


/*
A company is running multiple online advertising campaigns and wants to measure the performance of each ad. 
They need to determine key metrics suchas the Click Through Rate (CTR) 

Note : 

This is online
Not a TV

Explanation : Click --> Views or Conversion (changes)


Note : 
DB Revenue and Profit ?

Revenue is the total income a business generates from sales or services, also known as the "top line". 
Profit, or "net income," is the money left over after all expenses (such as costs of goods, operating expenses, and taxes) are subtracted from the revenue

*/

/*

Example 1 :

*/

CREATE TABLE Ads (
 AdID INT PRIMARY KEY,
 AdName VARCHAR(100),
 Views INT,
 Clicks INT,
 Conversions INT,
 Revenue DECIMAL(10, 2)
);

INSERT INTO Ads 
(AdID, AdName, Views, Clicks, Conversions, Revenue) VALUES 
(1,     'Ad 1', 1000, 100,      10,         500.00),
(2,     'Ad 2', 2000, 150,      20,         1000.00),
(3,     'Ad 3', 1500, 120,      15,         750.00),
(4,     'Ad 4', 1800, 180,      25,         1250.00);

SELECT 
 AdID,
 AdName,
 Views,
 Clicks,
 Conversions,
 Revenue,
 (Clicks * 100.0 / Views) AS ClickThroughRate,
 (Conversions * 100.0 / Clicks) AS ConversionRate,
 (Revenue / Conversions) AS RevenuePerConversion
FROM 
 Ads;


/*

Example 2


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


*/

SELECT
    ad_id,
    campaign_id,
    impressions,
    clicks,
    ROUND((clicks * 100.0 / impressions), 2) AS ctr_percentage
FROM ad_performance;

/*

OP

| ad_id | campaign_id | impressions | clicks | ctr_percentage |
| ----- | ----------- | ----------- | ------ | -------------- |
| 1     | C001        | 1000        | 50     | 5.00           |
| 2     | C001        | 2000        | 120    | 6.00           |
| 3     | C002        | 1500        | 30     | 2.00           |
| 4     | C002        | 2500        | 75     | 3.00           |
| 5     | C003        | 800         | 20     | 2.50           |

*/

SELECT
    campaign_id,
    SUM(clicks) AS total_clicks,
    SUM(impressions) AS total_impressions,
    ROUND(SUM(clicks) * 100.0 / SUM(impressions), 2) AS ctr_percentage
FROM ad_performance
GROUP BY campaign_id
ORDER BY ctr_percentage DESC;

/*

OP

| campaign_id | total_clicks | total_impressions | ctr_percentage |
| ----------- | ------------ | ----------------- | -------------- |
| C001        | 170          | 3000              | 5.67           |
| C002        | 105          | 4000              | 2.63           |
| C003        | 20           | 800               | 2.50           |

*/
