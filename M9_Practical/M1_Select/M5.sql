/*


Output :

Aditya Bansal       → Aditya | NULL   | Bansal
Vishnu Pratap Singh → Vishnu | Pratap | Singh
Rajat               → Rajat  | NULL   | NULL




CREATE TABLE customers (
    name VARCHAR(100)
);

INSERT INTO customers VALUES
('Pradeep'),
('Aarthi kumarasamy'),
('Bhavani kumarasamy raghavan');


*/



-- Query
SELECT 
    name,
    SUBSTRING_INDEX(name, ' ', 1) AS first_name,
    CASE 
        WHEN LENGTH(name) - LENGTH(REPLACE(name, ' ', '')) = 2
        THEN SUBSTRING_INDEX(SUBSTRING_INDEX(name, ' ', 2), ' ', -1)
        ELSE NULL
    END AS middle_name,
    CASE 
        WHEN LENGTH(name) - LENGTH(REPLACE(name, ' ', '')) >= 1
        THEN SUBSTRING_INDEX(name, ' ', -1)
        ELSE NULL
    END AS last_name
FROM customers;