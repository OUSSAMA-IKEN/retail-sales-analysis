
-- 1. Inspect the first 10 products
SELECT *
FROM products
ORDER BY product_id
LIMIT 10;

-- 2. Validate row count, IDs, and prices
SELECT
    COUNT(*) AS total_products,
    COUNT(product_id) AS non_null_ids,
    COUNT(DISTINCT product_id) AS unique_ids,
    MIN(product_id) AS min_product_id,
    MAX(product_id) AS max_product_id,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM products;

-- 3. Check missing required values
SELECT
    COUNT(*) FILTER (WHERE product IS NULL) AS null_products,
    COUNT(*) FILTER (WHERE category IS NULL) AS null_categories,
    COUNT(*) FILTER (WHERE price IS NULL) AS null_prices
FROM products;

-- 4. Check invalid prices
SELECT *
FROM products
WHERE price < 0;

-- 5. Check duplicate product IDs
SELECT product_id, COUNT(*) AS occurrences
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;
