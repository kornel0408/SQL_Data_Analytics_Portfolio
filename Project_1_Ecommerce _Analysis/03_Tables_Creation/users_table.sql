-- ===========================================================
					-- Ecommerce Analysis
-- ============================================================

-- users TABLE CREATION

CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    gender VARCHAR(10),
    city VARCHAR(100),
    signup_date DATE NOT NULL
);




