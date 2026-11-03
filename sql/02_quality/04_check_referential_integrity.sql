-- ============================================
-- PHASE 6: DATA QUALITY AND VALIDATION
-- CHECK 4: REFERENTIAL INTEGRITY
-- ============================================

-- 1. Orders referencing nonexistent customers
SELECT 
    o.order_id,
    o.customer_id
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 2. Order items referencing nonexistent orders
SELECT 
    oi.order_item_id,
    oi.order_id
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- 3. Order items referencing nonexistent products
SELECT
    oi.order_item_id,
    oi.product_id
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;