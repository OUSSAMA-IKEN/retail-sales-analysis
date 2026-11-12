-- ============================================
-- RETAIL SALES ANALYSIS
-- ORDER VALUE AND BASKET ANALYSIS
-- ============================================

-- 1. ORDER OVERVIEW
-- Business question:
-- Which customers placed each order, when were the orders placed,
-- and what is the recorded total amount of each order?
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;

-- 2. ORDER COMPOSITION
-- Business question:
-- How many different products and how many total units
-- are included in each order?
--
-- Requirements:
-- - Display the order ID.
-- - Count the number of distinct products in each order.
-- - Calculate the total quantity of units in each order.
-- - Group the results by order ID.
-- - Sort by total quantity in descending order.
SELECT
    o.order_id,
    COUNT(DISTINCT oi.product_id) As distinct_products_count,
    SUM(oi.quantity) AS total_units
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY total_units DESC;
   

