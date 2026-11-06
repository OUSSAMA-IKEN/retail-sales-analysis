
-- ============================================
-- PHASE 7: RELATIONAL ANALYSIS WITH JOINS
-- MILESTONE 7.2: LEFT JOIN AND RIGHT JOIN
-- ============================================


-- EXERCISE 1: Display all customers and their orders
-- Business question:
-- Can we see every registered customer,
-- including those who have never placed an order?

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;


-- EXERCISE 2: Find customers who never placed an order
-- Business question:
-- Which registered customers have never purchased anything?

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;


-- EXERCISE 3: Use RIGHT JOIN
-- Business question:
-- Can we retrieve the same information as Exercise 1
-- using RIGHT JOIN instead of LEFT JOIN?

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.total_amount
FROM orders o
RIGHT JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY c.customer_id;
