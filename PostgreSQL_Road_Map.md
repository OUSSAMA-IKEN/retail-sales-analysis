# PostgreSQL Learning Roadmap — Retail Sales Analysis

# ---- status : completed OR pending

## Phase 1 — Database Setup

**Goal:** Understand the database environment and organize the project.

### Tasks

1. Verify the active database connection.
2. Understand the difference between PostgreSQL, DBeaver and SQL.
3. Explore the database in DBeaver.
4. Understand databases, schemas and tables.
5. Organize SQL scripts in the project.

### Concepts to Learn

- Database engine vs database client.
- Database, schema, table, row and column.
- SQL query structure and statement execution.
- PostgreSQL naming conventions.
- `current_database()`, `current_user`, `CURRENT_TIMESTAMP`.
- Saving and organizing `.sql` files.

**Deliverable:** A working PostgreSQL database and a saved verification script.

Statut :

---

## Phase 2 — Dataset Inspection

**Goal:** Understand the raw data before designing the database.

### Tasks

1. Inspect the four CSV files.
2. Identify columns and sample values.
3. Determine which columns identify customers, orders and products.
4. Identify potential relationships between the files.
5. Record possible data-quality issues.

### Concepts to Learn

- CSV structure and delimiters.
- Data types: `INTEGER`, `NUMERIC`, `TEXT`, `DATE`, `TIMESTAMP`, `BOOLEAN`.
- Identifiers and candidate keys.
- Primary keys vs foreign keys.
- One-to-one, one-to-many and many-to-many relationships.
- Data profiling and metadata.

**Deliverable:** A data dictionary describing each table, its columns and intended data types.

Statut :

---

## Phase 3 — Database and Table Design

**Goal:** Build a relational database structure that matches the dataset.

### Tasks

1. Decide the columns for each table.
2. Choose PostgreSQL data types.
3. Create the tables.
4. Define primary keys.
5. Define foreign keys after confirming relationships.
6. Add appropriate constraints.

### Concepts to Learn

- `CREATE TABLE`.
- `INTEGER`, `BIGINT`, `VARCHAR`, `TEXT`, `NUMERIC`, `DATE`, `TIMESTAMP`.
- `PRIMARY KEY` and `FOREIGN KEY`.
- `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`.
- Referential integrity.
- `DROP TABLE` and `ALTER TABLE`.
- Basic normalization and avoiding unnecessary duplication.

**Deliverable:** SQL scripts that create the database tables correctly.

Statut :

---

## Phase 4 — Import the CSV Files

**Goal:** Load the raw data into PostgreSQL and verify the import.

### Tasks

1. Import each CSV through DBeaver.
2. Match CSV columns to PostgreSQL columns.
3. Resolve data-type and date-format problems.
4. Verify row counts.
5. Check that imported values match the source files.
6. Confirm that relationships are valid.

### Concepts to Learn

- DBeaver's CSV import wizard.
- PostgreSQL `COPY` and `\copy`.
- CSV headers, delimiters, encoding and quotation marks.
- Type conversion and casting.
- `COUNT(*)`.
- Transactions: `BEGIN`, `COMMIT`, `ROLLBACK`.
- Import errors and troubleshooting.

**Deliverable:** Four populated tables with verified data.

Statut :

---

## Phase 5 — SQL Fundamentals

**Goal:** Learn to retrieve, filter and sort data confidently.

### Tasks

1. Display all columns and a sample of rows.
2. Select specific columns.
3. Filter customers or orders by conditions.
4. Sort by date, price or quantity.
5. Limit results.
6. Handle missing values.
7. Remove duplicate values from query results.

### Concepts to Learn

- `SELECT` and `FROM`.
- `WHERE`.
- Comparison and logical operators: `=`, `<>`, `>`, `AND`, `OR`, `NOT`.
- `IN`, `BETWEEN`, `LIKE`, `ILIKE`.
- `ORDER BY`, `ASC`, `DESC`.
- `LIMIT` and `OFFSET`.
- `DISTINCT`.
- `IS NULL` and `IS NOT NULL`.
- SQL execution order at a basic level.

**Deliverable:** A collection of exploratory queries in `sql/01_exploration/`.

Statut :

---

## Phase 6 — Data Quality and Validation

**Goal:** Detect problems that could produce misleading business conclusions.

### Tasks

1. Count rows and check missing values.
2. Identify duplicate identifiers.
3. Detect invalid quantities or prices.
4. Find orders referencing missing customers.
5. Find order items referencing missing products.
6. Check inconsistent or unexpected dates.
7. Decide which issues require correction and document the decisions.

### Concepts to Learn

- `COUNT`, `MIN`, `MAX`.
- `COUNT(column)` vs `COUNT(*)`.
- `COALESCE`.
- `NULLIF`.
- `CASE WHEN`.
- Duplicate detection with `GROUP BY` and `HAVING`.
- Anti-joins for identifying unmatched records.
- Data validation rules.
- Difference between detecting an issue and modifying the data.

**Deliverable:** A data-quality report and validation SQL scripts.

Statut :

---

## Phase 7 — Relational Analysis with JOINs

**Goal:** Combine the four tables to answer questions that a single table cannot answer.

### Tasks

1. Connect customers to their orders.
2. Connect orders to their order items.
3. Connect order items to product details.
4. Calculate total spending per customer.
5. Identify the most frequently purchased products.
6. Compare results before and after joining tables.
7. Check for accidental duplication caused by joins.

### Concepts to Learn

- `INNER JOIN`.
- `LEFT JOIN`.
- `RIGHT JOIN` and `FULL OUTER JOIN`.
- `ON` conditions and table aliases.
- Primary and foreign key relationships.
- One-to-many join behavior.
- `GROUP BY`.
- Aggregations: `SUM`, `AVG`, `COUNT`, `MIN`, `MAX`.
- `HAVING` vs `WHERE`.
- Counting distinct customers and orders.
- Join fan-out and double-counting.

**Deliverable:** Your first meaningful multi-table business analysis.

Statut :

---

## Phase 8 — Business Analysis and Intermediate SQL

**Goal:** Turn raw data into useful answers for business questions.

### Tasks

1. Calculate revenue by product category.
2. Rank cities by sales.
3. Segment customers by spending.
4. Compare sales across months.
5. Find customers whose spending exceeds a threshold.
6. Identify products with high sales but low order frequency.
7. Build queries that combine multiple conditions.

### Concepts to Learn

- `CASE WHEN` for categorization.
- Date extraction and date arithmetic.
- `EXTRACT`, `DATE_TRUNC` and date intervals.
- Conditional aggregation with `FILTER` or `CASE`.
- Subqueries.
- Common Table Expressions (`WITH`).
- `UNION` and `UNION ALL`.
- Ratios, percentages and safe division.
- Aggregate calculations and business metric definitions.

**Deliverable:** Documented business questions and their SQL answers.

Statut :

---

## Phase 9 — Advanced PostgreSQL Analytics

**Goal:** Analyze customer behavior and compare individual records against groups.

### Tasks

1. Rank products within each category.
2. Find each customer's first and latest order.
3. Calculate cumulative sales over time.
4. Compare an order with the previous order.
5. Identify top customers in each city.
6. Create customer segments using purchasing behavior.

### Concepts to Learn

- Window functions.
- `OVER`, `PARTITION BY`, `ORDER BY`.
- `ROW_NUMBER`, `RANK`, `DENSE_RANK`.
- `LAG` and `LEAD`.
- Running totals with `SUM() OVER`.
- Window frames.
- Advanced CTEs and multi-step analytical queries.
- PostgreSQL-specific features where useful.

**Deliverable:** Advanced analytical queries demonstrating SQL skills beyond basic reporting.

Statut :

---

## Phase 10 — Reusable Database Objects

**Goal:** Make frequently used analyses reusable and improve the database structure.

### Tasks

1. Save a query as a database view.
2. Create views for customer metrics or product performance.
3. Review constraints and relationships.
4. Identify columns frequently used in filters and joins.
5. Add indexes only when justified.

### Concepts to Learn

- `CREATE VIEW` and `CREATE OR REPLACE VIEW`.
- Views vs tables.
- Index fundamentals and B-tree indexes.
- Indexes on join and filter columns.
- Trade-offs between query speed, storage and write overhead.
- Schema changes and maintainability.

**Deliverable:** A small set of reusable views for reporting.

Statut :

---

## Phase 11 — Query Performance and Optimization

**Goal:** Understand how PostgreSQL executes queries.

### Tasks

1. Select a representative multi-table query.
2. Inspect its execution plan.
3. Identify scans, joins and expensive operations.
4. Compare a query before and after a justified index.
5. Confirm that optimization does not change the result.

### Concepts to Learn

- `EXPLAIN`.
- `EXPLAIN ANALYZE`.
- Sequential scans vs index scans.
- Query planner fundamentals.
- Join strategies.
- Selectivity and statistics.
- Why an index is not always beneficial.
- Measuring performance rather than guessing.

**Deliverable:** One documented query optimization experiment.

---

## Phase 12 — Final Portfolio Project

**Goal:** Present the work as a credible Data Analyst project.

### Tasks

1. Organize and name all SQL scripts consistently.
2. Document the dataset and its limitations.
3. Summarize data-quality findings.
4. Present key business questions and results.
5. Explain the SQL approach and important decisions.
6. Add screenshots or charts if useful.
7. Write a professional README.
8. Publish the project on GitHub without exposing sensitive information or unnecessary raw files.

### Concepts to Learn

- Reproducible analysis.
- SQL documentation and code organization.
- Business interpretation of results.
- Separating methodology, findings and recommendations.
- Git and GitHub workflow.
- Portfolio presentation and technical storytelling.

**Deliverable:** A GitHub-ready PostgreSQL project demonstrating database design, data validation, multi-table SQL analysis and advanced querying.

---

## Learning Method for Every Phase

Each phase follows the same cycle:

1. **Understand:** Why the task matters and which concept it requires.
2. **Learn:** Study a short explanation and a small example.
3. **Practice:** Write or modify the SQL query yourself.
4. **Validate:** Execute it in DBeaver and interpret the result.
5. **Document:** Save the working query and explain what you learned.

The project will be developed incrementally. Each concept will be learned when the project needs it, and solutions will not be provided all at once.

## Current Progress

- **Phase 1:** Database connection verified.
- **Phase 2:** Dataset downloaded and placed in the project.
- **Next task:** Inspect the actual CSV headers, starting with `customers.csv`.
- **After inspection:** Create the first table with appropriate PostgreSQL data types, then import and validate its data.

The curriculum prioritizes concepts that are useful for practical Data Analyst work rather than attempting to cover every PostgreSQL feature.
