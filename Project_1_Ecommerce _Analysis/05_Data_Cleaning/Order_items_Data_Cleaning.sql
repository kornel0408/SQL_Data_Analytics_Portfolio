-- ======================================================
					-- 	DATA CLEANING
-- ======================================================

-- ----------------------------------
--  Order_items TABLE DATA CLEANING
-- ----------------------------------

-- 1. Null value checking
SELECT * FROM
order_items
WHERE order_item_id IS NULL 
OR order_id IS  NULL
or product_id IS NULL
or user_id IS NULL
or quantity IS NULL
or item_price IS NULL
or item_total IS NULL;

SELECT * FROM
order_items
WHERE order_item_id = ''
OR order_id = ''
or product_id = ''
or user_id = ''
or quantity = ''
or item_price = ''
or item_total = '';

-- 2. Finding Duplicate rows
SELECT *,
COUNT(*) as 'count'
FROM order_items
GROUP BY order_item_id,
		 order_id,
         product_id,
         user_id,
         quantity,
         item_price,
         item_total
HAVING count(*) > 1;

-- 3.Invalid categories
SELECT quantity
FROM order_items
WHERE quantity < 0;

SELECT item_price
FROM order_items
WHERE item_price < 0;

SELECT item_total
FROM order_items
WHERE item_total < 0;

SELECT * FROM
order_items
LIMIT 10;