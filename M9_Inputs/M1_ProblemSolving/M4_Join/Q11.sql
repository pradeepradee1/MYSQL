/*

 How do you safely join product & transaction tables while excluding null foreign keys?

*/

SELECT t.transaction_id, t.amount, p.product_name
FROM transactions t
JOIN products p
    ON t.product_id = p.product_id
WHERE t.product_id IS NOT NULL;


/* Alternative filter inside */

SELECT t.transaction_id, t.amount, p.product_name
FROM transactions t
JOIN products p
    ON t.product_id = p.product_id
    AND t.product_id IS NOT NULL;
