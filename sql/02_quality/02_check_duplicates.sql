-- checking duplicate values in orders
SELECT
    customer_id,
    COUNT(*) AS occurrences
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- checking duplicate values in products
SELECT
    order_id,
    COUNT(*) AS occurrences
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- checking duplicate values in order_items
SELECT
    product_id,
    COUNT(*) AS occurrences
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- checking duplicate values in order_items
SELECT
    order_item_id,
    COUNT(*) AS occurrences
FROM order_items
GROUP BY order_item_id
HAVING COUNT(*) > 1;