-- checking missing values in customers
SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_ids,
    COUNT(*) FILTER (WHERE customer_name IS NULL) AS missing_names,
    COUNT(*) FILTER (WHERE gender IS NULL) AS missing_genders,
    COUNT(*) FILTER (WHERE age IS NULL) AS missing_ages,
    COUNT(*) FILTER (WHERE age_bracket IS NULL) AS missing_age_brackets,
    COUNT(*) FILTER (WHERE city IS NULL) AS missing_cities
FROM customers;

-- checking missing values in orders
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_ids,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_ids,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS missing_dates,
    COUNT(*) FILTER (WHERE total_amount IS NULL) AS missing_amounts
FROM orders;

-- checking missing values in products
SELECT
    COUNT(*) FILTER (WHERE product_id IS NULL) AS missing_product_id,
    COUNT(*) FILTER (WHERE product IS NULL) AS missing_product_name,
    COUNT(*) FILTER (WHERE category IS NULL) AS missing_category,
    COUNT(*) FILTER (WHERE price IS NULL) AS missing_price
FROM products;

-- checking missing values in order_items
SELECT
    COUNT(*) FILTER (WHERE order_item_id IS NULL) AS missing_order_item_id,
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS missing_product_id,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS missing_quantity,
    COUNT(*) FILTER (WHERE unit_price IS NULL) AS missing_unit_price
FROM order_items;