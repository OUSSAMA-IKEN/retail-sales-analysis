
-- Validate the number of imported customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Check customer ID completeness and uniqueness
SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_id) AS not_nulls,
    COUNT(DISTINCT customer_id) AS unique_ids,
    MIN(customer_id) AS min_id,
    MAX(customer_id) AS max_id
FROM customers;

-- Inspect available gender values
SELECT DISTINCT gender
FROM customers
ORDER BY gender;

-- Inspect available age brackets
SELECT DISTINCT age_bracket
FROM customers
ORDER BY age_bracket;
