CREATE TABLE products(
    product_id INTEGER PRIMARY KEY,
    product TEXT NOT NULL,
    category TEXT NOT NULL, 
    price NUMERIC(10, 2) NOT NULL
)