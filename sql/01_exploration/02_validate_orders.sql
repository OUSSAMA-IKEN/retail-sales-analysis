
-- 1. Inspect the first 10 orders
SELECT *
FROM orders
ORDER BY order_id
LIMIT 10;

-- 2. Validate row count, IDs, dates, and amounts
SELECT
    COUNT(*) AS total_orders,
    COUNT(order_id) AS non_null_ids,
    COUNT(DISTINCT order_id) AS unique_ids,
    MIN(order_id) AS min_order_id,
    MAX(order_id) AS max_order_id,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    MIN(total_amount) AS min_amount,
    MAX(total_amount) AS max_amount
FROM orders;

-- 3. Check for missing required values
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS null_order_ids,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_ids,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS null_order_dates,
    COUNT(*) FILTER (WHERE total_amount IS NULL) AS null_amounts
FROM orders;

-- 4. Check for orders referencing nonexistent customers
SELECT COUNT(*) AS orders_without_customer
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 5. Check for duplicate order IDs
SELECT order_id, COUNT(*) AS occurrences
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;
