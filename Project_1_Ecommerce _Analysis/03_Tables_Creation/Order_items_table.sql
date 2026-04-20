-- ===========================================================
					-- Ecommerce Analysis
-- ============================================================

-- order_items TABLE CREATION

CREATE TABLE order_items (
    order_item_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    item_price DECIMAL(10,2) NOT NULL CHECK (item_price >= 0),
    item_total DECIMAL(10,2) NOT NULL CHECK (item_total >= 0),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id),

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);
