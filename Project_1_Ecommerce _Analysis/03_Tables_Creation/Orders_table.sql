-- ===========================================================
					-- Ecommerce Analysis
-- ============================================================

-- orders TABLE CREATION

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

