-- ===========================================================
					-- Ecommerce Analysis
-- ============================================================

-- products TABLE CREATION

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5)
);
