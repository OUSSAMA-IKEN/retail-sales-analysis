
-- ============================================
-- PHASE 6: DATA QUALITY AND VALIDATION
-- CHECK 5: BUSINESS CONSISTENCY
-- ============================================


-- 1. Calculate the total value of each order

SELECT
    o.order_id,
    COALESCE(
        SUM(oi.quantity * oi.unit_price), 0
    ) AS calculated_total
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id;


-- 2. Compare calculated totals with recorded totals

SELECT
    o.order_id,
    o.total_amount,
    COALESCE(
        SUM(oi.quantity * oi.unit_price), 0
    ) AS calculated_total
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id, o.total_amount
HAVING o.total_amount <>
       COALESCE(SUM(oi.quantity * oi.unit_price), 0);


-- 3. Identify orders without any order items

SELECT
    o.order_id
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;


-- 4. Identify order items with invalid quantities or prices

SELECT
    oi.order_item_id,
    oi.order_id,
    oi.quantity,
    oi.unit_price
FROM order_items oi
WHERE oi.quantity <= 0
   OR oi.unit_price < 0;
