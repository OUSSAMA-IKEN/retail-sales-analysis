
-- ============================================
-- PHASE 7: RELATIONAL ANALYSIS WITH JOINS
-- MILESTONE 7.1: INNER JOIN
-- ============================================


-- Todo 1: Display customer orders
-- Join customers with orders.
-- Display customer information and their orders.

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;


-- Todo 2: Filter orders by customer
-- Display orders belonging to Liam Smith.

SELECT
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.customer_name = 'Liam Smith';


-- Todo 3: Count orders per customer
-- Display the number of orders for each customer.
-- Sort from highest to lowest.

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_orders DESC;
