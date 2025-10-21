/*


As a business owner, you’re looking to gain insights into weekly sales trends. Specifically, 
you’d like to see the total units sold in each category,
broken down by each day of the week. Here’s a solution that structures each day as a separate column in the report!

*/

#Create the Items table

CREATE TABLE Items1 (
 item_id INT,
 item_category VARCHAR(50)
);

#Create the Orders1 table
CREATE TABLE Orders (
 order_id INT,
 item_id INT,
 order_date DATE,
 quantity INT
);

-- Insert sample data into the Items table
INSERT INTO Items1 (item_id, item_category) VALUES 
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

-- Insert sample data into the Orders table
INSERT INTO Orders1 (order_id, item_id, order_date, quantity) VALUES 
(1, 1, '2024-10-01', 10),
(2, 1, '2024-10-02', 15),
(3, 2, '2024-10-01', 20),
(4, 2, '2024-10-04', 25),
(5, 1, '2024-10-01', 5),
(6, 3, '2024-10-03', 8),
(7, 3, '2024-10-02', 12),
(8, 2, '2024-10-02', 18),
(9, 1, '2024-10-05', 30),
(10, 3, '2024-10-01', 7);


SELECT 
 b.item_category AS 'CATEGORY',
 SUM(CASE WHEN WEEKDAY(a.order_date) = 0 THEN a.quantity ELSE 0 END) AS 'MONDAY',
 SUM(CASE WHEN WEEKDAY(a.order_date) = 1 THEN a.quantity ELSE 0 END) AS 'TUESDAY',
 SUM(CASE WHEN WEEKDAY(a.order_date) = 2 THEN a.quantity ELSE 0 END) AS 'WEDNESDAY',
 SUM(CASE WHEN WEEKDAY(a.order_date) = 3 THEN a.quantity ELSE 0 END) AS 'THURSDAY',
 SUM(CASE WHEN WEEKDAY(a.order_date) = 4 THEN a.quantity ELSE 0 END) AS 'FRIDAY',
 SUM(CASE WHEN WEEKDAY(a.order_date) = 5 THEN a.quantity ELSE 0 END) AS 'SATURDAY',
 SUM(CASE WHEN WEEKDAY(a.order_date) = 6 THEN a.quantity ELSE 0 END) AS 'SUNDAY'
FROM 
 Orders a 
RIGHT JOIN 
 Items b 
ON 
 a.item_id = b.item_id
GROUP BY 
 b.item_category
ORDER BY 
 b.item_category;

