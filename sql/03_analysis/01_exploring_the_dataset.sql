-- 1. Explore customers
SELECT *
FROM customers
LIMIT 10;

-- 2. Explore orders
SELECT *
FROM orders
ORDER BY order_date 
LIMIT 10;

-- 3. Explore products
SELECT product, category, price
FROM products
ORDER BY price DESC
LIMIT 10;

-- 4. Explore order items
SELECT *
FROM order_items
LIMIT 10;