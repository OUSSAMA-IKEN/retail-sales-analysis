
-- ============================================
-- PHASE 6: DATA QUALITY AND VALIDATION
-- CHECK 3: INVALID VALUES
-- ============================================

-- 1. CUSTOMERS
SELECT *
FROM customers
WHERE age <= 0
   OR gender NOT IN ('Male', 'Female')
   OR age_bracket NOT IN ('Young', 'Working Class', 'Retired')
   OR TRIM(customer_name) = ''
   OR TRIM(city) = '';


-- 2. ORDERS
SELECT *
FROM orders
WHERE total_amount <= 0
   OR order_date > CURRENT_DATE;


-- 3. PRODUCTS
SELECT *
FROM products
WHERE price < 0
   OR TRIM(product) = ''
   OR TRIM(category) = '';


-- 4. ORDER ITEMS
SELECT *
FROM order_items
WHERE quantity <= 0
   OR unit_price < 0;
