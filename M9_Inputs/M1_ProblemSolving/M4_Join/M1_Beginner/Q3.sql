/*

 How do you safely join product & transaction tables while excluding null foreign keys?

*/

/*

CREATE TABLE product3 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE transaction3 (
    txn_id INT PRIMARY KEY,
    product_id INT,  -- foreign key to product.product_id
    amount DECIMAL(10,2)
);

INSERT INTO product3 (product_id, product_name) 
VALUES
(1, 'Laptop'),
(2, 'Phone'),
(3, 'Tablet'),
(4, 'Headphones');

INSERT INTO transaction3 (txn_id, product_id, amount) 
VALUES
(101, 1, 1200.00),
(102, 2, 800.00),
(103, NULL, 500.00),     -- Invalid transaction (no product_id)
(104, 3, 600.00),
(105, 99, 300.00);       -- Nonexistent product_id (no match)


OP
txn_id | product_id | product_name | amount
--------------------------------------------
101    | 1          | Laptop       | 1200.00
102    | 2          | Phone        | 800.00
104    | 3          | Tablet       | 600.00



*/

SELECT   
	t.txn_id, t.amount, p.product_name
FROM 
	transaction3 t JOIN product3 p ON t.product_id = p.product_id
WHERE t.product_id IS NOT NULL;


/* Alternative filter inside */

SELECT t.transaction_id, t.amount, p.product_name
FROM transactions t
JOIN products p
    ON t.product_id = p.product_id
    AND t.product_id IS NOT NULL;
