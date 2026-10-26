-- 1. Check the number of rows in each table
SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'products', COUNT(*) FROM products;

--2. items without order and items without product
SELECT
    COUNT(*) FILTER (
        WHERE o.order_id IS NULL
    ) AS items_without_order,
    COUNT(*) FILTER (
        WHERE p.product_id IS NULL
    ) AS items_without_product
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
LEFT JOIN products p
    ON oi.product_id = p.product_id;