
-- ============================================
-- RETAIL SALES ANALYSIS
-- PRODUCT SALES AND REVENUE ANALYSIS
-- ============================================


-- 1. PRODUCT PURCHASE DETAILS
-- Business question:
-- What products were purchased in each order,
-- and which customers purchased them?

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    p.product_id,
    p.product,
    p.category,
    oi.quantity,
    oi.unit_price
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;


-- 2. PRODUCT SALES PERFORMANCE
-- Business question:
-- How many units of each product were sold,
-- and how much revenue did each product generate?

SELECT
    p.product_id,
    p.product,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product
ORDER BY total_units_sold DESC;


-- 3. CATEGORY SALES PERFORMANCE
-- Business question:
-- Which product categories generate the most revenue?

SELECT
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- 4. CUSTOMER PRODUCT PURCHASES
-- Business question:
-- Which products have been purchased by each customer?

SELECT
    c.customer_id,
    c.customer_name,
    p.product_id,
    p.product,
    SUM(oi.quantity) AS total_units_purchased,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id          
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name, p.product_id, p.product
ORDER BY c.customer_id, total_spent DESC;   

