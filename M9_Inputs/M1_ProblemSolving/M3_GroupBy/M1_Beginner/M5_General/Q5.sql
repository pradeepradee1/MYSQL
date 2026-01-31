/*
Group Sold Products By The Date

Input: 
Activities table:
+------------+------------+
| sell_date | product |
+------------+------------+
| 2020-05-30 | Headphone |
| 2020-06-01 | Pencil |
| 2020-06-02 | Mask |
| 2020-05-30 | Basketball |
| 2020-06-01 | Bible |
| 2020-06-02 | Mask |
| 2020-05-30 | T-Shirt |
+------------+------------+
Output: 
+------------+----------+------------------------------+
| sell_date | num_sold | products |
+------------+----------+------------------------------+
| 2020-05-30 | 3 | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2 | Bible,Pencil |
| 2020-06-02 | 1 | Mask |
+------------+----------+------------------------------+

*/

SELECT 
    sell_date, 
    COUNT( DISTINCT product) AS num_sold, 
    GROUP_CONCAT( DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM 
    Activities
GROUP BY 
    sell_date
