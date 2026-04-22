-- ======================================================
					-- 	DATA CLEANING
-- ======================================================

-- --------------------------------
--  Products TABLE DATA CLEANING
-- --------------------------------

-- 1. Null value checks

SELECT * 
FROM products
WHERE product_id IS NULL OR
product_name IS NULL OR
category IS NULL OR
brand IS NULL OR
price IS NULL OR
rating IS NULL ;

SELECT * 
FROM products
WHERE product_id = '' OR
product_name = '' OR
category = '' OR
brand = '' OR
price = '' OR
rating = '' ;

-- 2. Finding Duplicate rows
WITH find_dup as(
SELECT *, 
ROW_NUMBER() OVER(PARTITION BY product_name,category,brand,price,rating) AS rnk
FROM products
)

SELECT * FROM 
find_dup WHERE rnk > 1;

-- 3.Invalid categories
SELECT DISTINCT category
from products;

SELECT DISTINCT brand 
FROM products;

SELECT rating 
FROM products
WHERE rating > 5 or rating < 0;

SELECT price
FROM products
WHERE price < 0;

SELECT * FROM
products
LIMIT 10;