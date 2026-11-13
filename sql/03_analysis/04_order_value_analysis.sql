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
SELECT
    o.order_id,
    COUNT(DISTINCT oi.product_id) As distinct_products_count,
    SUM(oi.quantity) AS total_units
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY total_units DESC;

-- 3. CALCULATED ORDER VALUE
-- Business question:
-- What is the calculated value of the products included
-- in each order, based on the actual transaction prices?
SELECT 
    o.order_id,
    SUM(oi.quantity * oi.unit_price) AS order_value
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id 
ORDER BY order_value DESC;

-- 4. HIGH-VALUE ORDERS
-- Business question:
-- Which orders have the highest recorded total amounts,
-- and which customers placed those orders?
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.customer_id,
    o.total_amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.total_amount DESC
LIMIT 10;

-- 5. ORDER VALUE COMPARISON
-- Business question:
-- Which orders have a difference between their recorded total
-- and the calculated total based on their order items?
SELECT
    o.order_id,
    o.total_amount AS recorded_total,
    SUM(oi.quantity * oi.unit_price) AS calculated_total,
    (o.total_amount - SUM(oi.quantity * oi.unit_price)) AS difference
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id, o.total_amount
HAVING difference != 0
ORDER BY ABS(difference) DESC;

