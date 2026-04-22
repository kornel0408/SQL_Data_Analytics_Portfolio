-- ======================================================
					-- 	DATA CLEANING
-- ======================================================

-- --------------------------------
--  Orders TABLE DATA CLEANING
-- --------------------------------

-- 1. Null value checking

SELECT * 
FROM orders
WHERE order_id IS NULL
OR user_id IS NULL
OR order_date IS NULL
OR order_status IS NULL
OR total_amount IS NULL;

SELECT * 
FROM orders
WHERE order_id = ''
OR user_id = ''
OR order_status = ''
OR total_amount = '';

-- 2. Finding Duplicate rows

SELECT *, count(*)
FROM orders
GROUP BY order_id,
		user_id,
        order_date,
        order_status,
        total_amount
HAVING COUNT(*) > 1;

-- 3.Invalid categories

SELECT *
FROM orders
WHERE str_to_date(order_date, '%Y-%m-%d') IS NULL;

SELECT DISTINCT
order_status
FROM orders;

SELECT total_amount
FROM orders
WHERE total_amount < 1;



