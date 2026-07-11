/*


CREATE TABLE customers (
    name VARCHAR(100)
);

INSERT INTO customers VALUES
('Pradeep'),
('Aarthi kumarasamy'),
('Bhavani kumarasamy raghavan');


Sampie Input:

| name                        |
| --------------------------- |
| Pradeep                     |
| Aarthi kumarasamy           |
| Bhavani kumarasamy raghavan |


Sample Output:

| FirstName | MiddleName | LastName   |
| --------- | ---------- | ---------- |
| Pradeep   | NULL       | NULL       |
| Aarthi    | NULL       | kumarasamy |
| Bhavani   | kumarasamy | raghavan   |


*/



-- Query
SELECT 
    name,
    SUBSTRING_INDEX(name, ' ', 1) AS first_name,
    CASE 
        WHEN LENGTH(name) - LENGTH(REPLACE(name, ' ', '')) = 2 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(name, ' ', 2), ' ', -1)
        ELSE NULL
    END AS middle_name,
    CASE 
        WHEN LENGTH(name) - LENGTH(REPLACE(name, ' ', '')) >= 1 THEN SUBSTRING_INDEX(name, ' ', -1)
        ELSE NULL
    END AS last_name
FROM customers;


select 
	*,
	SUBSTRING_INDEX(name," ",1) as first_name,
	if( length(name) - length(REPLACE(name," ","")) =2 , SUBSTRING_INDEX(SUBSTRING_INDEX(name," ",2)," ",-1) ,null) as middle_name,
	if( length(name) - length(REPLACE(name," ","")) >= 1 , SUBSTRING_INDEX(name," ",-1) ,null) as last_name
from 
	customers 
