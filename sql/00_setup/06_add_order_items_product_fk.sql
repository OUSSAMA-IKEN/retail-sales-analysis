
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_products
    FOREIGN KEY (product_id)
    REFERENCES products(product_id);
