
CREATE or replace TABLE Temp (
 AdID INT PRIMARY KEY,
 AdName VARCHAR(100),
 Views INT,
 Clicks INT,
 Conversions INT,
 Revenue DECIMAL(10, 2)
);

INSERT INTO Temp 
(AdID, AdName, Views, Clicks, Conversions, Revenue) VALUES 
(1,     'Ad 1', 1000, 100,      10,         500.00),
(2,     'Ad 2', 2000, 150,      20,         1000.00),
(3,     'Ad 3', 1500, 120,      15,         750.00),
(4,     'Ad 4', 1800, 180,      25,         1250.00);



/*

Ex : Youtube ---> View ---> Click ---> Conversion ----> Revenue

| Column      | Meaning                                             |
| ----------- | --------------------------------------------------- |
| Views       | How many people saw the ad                          |
| Clicks      | How many people clicked                             |
| Conversions | How many completed desired action (purchase/signup) |
| Revenue     | Money earned from that ad                           |

*/

/*

Problem 1 :

Click Through Rate (CTR) 

Explanation : who saw the ad, how many clicked it

CTR     =   (Clicks ÷ Views)  ×   100

Note : We need to find the click, that is reason clicks is first in the percentage

*/

SELECT 
    AdID,
    AdName,
    Views,
    Clicks,
    (Clicks / Views) * 100.0  AS CTR_Percentage
FROM Temp;

/*

Problem 2 :


Conversion Rate 

Explanation :
                Out of people who clicked, how many actually converted?

Formulae : 
            ConversionRate = (Conversions ÷ Clicks) × 100

Note : We need to find the Conversions, that is reason Conversions is first in the percentage

*/

SELECT 
    AdID,
    AdName,
    Clicks,
    Conversions,
    (Conversions / Clicks) * 100   AS Conversion_Rate
FROM Temp;

/*

Problem 3 

Revenue Per Click (RPC)

How much money you earn per click.

Formmule :
            Revenue ÷   Clicks

Note : 
        We need to find the Revenue, that is reason Revenue is first 
        They aren't asking the percentage here


*/

SELECT 
    AdID,
    AdName,
    Revenue,
    Clicks,
    Revenue / Clicks  AS Revenue_Per_Click
FROM Temp;


/*

Problem 4

Revenue Per View (RPV)

How much money you earn per click.

Formmule :
            Revenue ÷   Views

Note : We need to find the Revenue, that is reason Revenue is first 

*/

SELECT 
    AdID,
    AdName,
    Revenue / Views  AS Revenue_Per_View
FROM Temp;
