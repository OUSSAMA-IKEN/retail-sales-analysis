
-- 1. Inspect the first 10 order items
SELECT *
FROM order_items
ORDER BY order_item_id
LIMIT 10;

-- 2. Validate row count, IDs, quantities, and prices
SELECT
    COUNT(*) AS total_items,
    COUNT(order_item_id) AS non_null_ids,
    COUNT(DISTINCT order_item_id) AS unique_ids,
    MIN(order_item_id) AS min_item_id,
    MAX(order_item_id) AS max_item_id,
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,
    MIN(unit_price) AS min_unit_price,
    MAX(unit_price) AS max_unit_price
FROM order_items;

-- 3. Check for invalid quantities or prices
SELECT *
FROM order_items
WHERE quantity <= 0
   OR unit_price < 0;

-- 4. Check for order items referencing nonexistent orders
SELECT COUNT(*) AS items_without_order
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- 5. Check for duplicate order item IDs
SELECT order_item_id, COUNT(*) AS occurrences
FROM order_items
GROUP BY order_item_id
HAVING COUNT(*) > 1;
