-- ===============================================================
--               Expolatory Data Analysis (EDA)
-- ===============================================================

-- EDA Product perfoamance analysis
-- What we find here?

-- 1.Total Products sold
-- 2.Total sale by brand
-- 3.Total Sale by category
-- 4.Average sales by category
-- 5.TOP 5 products by total quantity
-- 6.Top products in each city by its quantity
-- 7.Best products by ratings
-- 8.Worst products by ratings
-- 9.Which Product is more viewed 
-- 10.Least viewed product
-- 11.Most purchased product 
-- 12.Least purchased product

-- 1.Total Products sold
	SELECT SUM(quantity) 
    FROM order_items oi
    JOIN orders o
		ON oi.order_id = o.order_id
	WHERE order_status = "COMPLETED";

-- 2.Total sale by brand
	SELECT brand, SUM(item_total) as total
    FROM order_items oi
    JOIN products p
		ON p.product_id = oi.product_id
    JOIN orders o
		ON oi.order_id = o.order_id
	WHERE order_status = "COMPLETED"
	GROUP BY brand 
    ORDER BY total DESC;

-- 3.Total Sale by category
	SELECT category, SUM(item_total) as total
    FROM order_items oi
    JOIN products p
		ON p.product_id = oi.product_id
    JOIN orders o
		ON oi.order_id = o.order_id
	WHERE order_status = "COMPLETED"
	GROUP BY category
    ORDER BY total DESC;

-- 4.Average sales by category
	SELECT category, ROUND(AVG(item_total), 2) as average
    FROM order_items oi
    JOIN products p
		ON p.product_id = oi.product_id
    JOIN orders o
		ON oi.order_id = o.order_id
	WHERE order_status = "COMPLETED"
	GROUP BY category
    ORDER BY average DESC;

-- 5.TOP 5 products by total quantity
	SELECT product_name, COUNT(quantity) as total_quantity
    FROM order_items oi
    JOIN products p
		ON p.product_id = oi.product_id
    JOIN orders o
		ON oi.order_id = o.order_id
	WHERE order_status = "COMPLETED"
	GROUP BY product_name
    ORDER BY total_quantity DESC
    limit 5;

-- 6.Top products in each city by qty
WITH CTE as(
	SELECT  
    city, product_name, COUNT(quantity) as total_quantity,
    DENSE_RANK() OVER(PARTITION BY city ORDER BY SUM(quantity) DESC) AS rnk
    FROM order_items oi
    JOIN products p
		ON p.product_id = oi.product_id
    JOIN orders o
		ON oi.order_id = o.order_id
	JOIN users u
		on u.user_id = oi.user_id
	WHERE order_status = "COMPLETED"
	GROUP BY city, product_name
    ORDER BY total_quantity DESC)
    
    SELECT city, product_name as 'most selling product'
    FROM CTE
    WHERE rnk = 1;

-- 7.Best products by ratings
	SELECT product_name,ROUND(AVG(R.rating),1) avg_rating
    FROM products p
    JOIN reviews r
		on p.product_id = r.product_id
	GROUP BY product_name
    HAVING avg_rating >= 4.5
    ORDER BY avg_rating 
    DESC;

-- 8.Worst Products based on rating
	SELECT product_name,ROUND(AVG(R.rating),1) avg_rating
    FROM products p
    JOIN reviews r
		on p.product_id = r.product_id
	GROUP BY product_name
    HAVING avg_rating >= 4.5
    ORDER BY avg_rating 
    DESC;

-- 9.Which Product is more viewed 
	SELECT p.product_name, COUNT(event_type) total_views
    FROM events e
    JOIN products p
		ON e.product_id = p.product_id
	WHERE e.event_type = 'view'
	GROUP BY p.product_name
    ORDER BY total_views
    DESC ;

-- 10.Least viewed product
	SELECT p.product_name, COUNT(event_type) total_views
    FROM events e
    JOIN products p
		ON e.product_id = p.product_id
	WHERE e.event_type = 'view'
	GROUP BY p.product_name
    ORDER BY total_views;

-- 11.Most purchased product 
	SELECT p.product_name, COUNT(event_type) total_purchases
    FROM events e
    JOIN products p
		ON e.product_id = p.product_id
	WHERE e.event_type = 'purchase'
	GROUP By p.product_name
    ORDER BY total_purchases DESC;
    
-- 12.Least purchased product
SELECT p.product_name, COUNT(event_type) total_purchases
    FROM events e
    JOIN products p
		ON e.product_id = p.product_id
	WHERE e.event_type = 'purchase'
	GROUP By p.product_name
    ORDER BY total_purchases ;

	