# Data Quality Report – Retail Sales Analysis

## 1. Overview

This report summarizes the data quality checks performed on the four project tables:

- customers
- orders
- products
- order_items

The objective is to evaluate data completeness, uniqueness, validity, relationships, and business consistency.

## 2. Missing Values

**Status: Passed**

Checked all columns in the four tables for NULL values.

Result:

- No missing values detected.

## 3. Duplicate Records

**Status: Passed**

Checked primary key uniqueness in all four tables.

Result:

- No duplicate customer IDs.
- No duplicate order IDs.
- No duplicate product IDs.
- No duplicate order item IDs.

## 4. Invalid Values

**Status: Verification required**

Checked:

- Customer ages, genders, age brackets, names, and cities.
- Order amounts and dates.
- Product prices, names, and categories.
- Order item quantities and unit prices.

The SQL validation script was created. Record the final result after verifying its execution.

## 5. Referential Integrity

**Status: Passed**

Checked three relationships:

- orders → customers
- order_items → orders
- order_items → products

Result:

- No records referencing nonexistent parent IDs.

## 6. Business Consistency

**Status: Issues detected**

Compared recorded order totals with calculated totals:

Calculated total = SUM(quantity × unit_price)

Findings:

- 100 orders have differences between recorded and calculated totals.
- 33 orders have no associated order items.
- No invalid quantities or negative unit prices were detected.

These findings indicate inconsistencies in the source dataset.

No records were modified or deleted during validation.

## 7. Conclusion

The database passed the missing values, duplicate ID, and referential integrity checks.

However, business consistency issues were identified, particularly missing order items and differences between recorded and calculated order totals.

These limitations should be considered when interpreting future business analysis results.

## 8. Validation Scripts

The SQL scripts used during this phase are located in:

`sql/02_quality/`

- 01_check_missing_values.sql
- 02_check_duplicates.sql
- 03_check_invalid_values.sql
- 04_check_referential_integrity.sql
- 05_check_business_consistency.sql
