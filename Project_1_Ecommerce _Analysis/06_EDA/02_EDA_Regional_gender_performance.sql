-- ===============================================================
--               Expolatory Data Analysis (EDA)
-- ===============================================================

-- EDA ON users
-- What we find here?

-- 1.total customers by gender
-- 2.Total sales by gender
-- 3.Average sales by gender
-- 4.top 5 cities by total sales
-- 5.top 5 cities by Avg sales
-- 6.Total orders by city
-- 7.Top 5 Highest Spending Customers
-- 8.Frequently buying customers
-- 9.citites with most cancellations orders

-- total customers by gender
	SELECT gender, count(user_id) as total_count
    FROM users
    GROUP BY gender
    ORDER BY total_count DESC;
    
-- . Total sales by gender
	SELECT gender, sum(total_amount) AS total_sales
    FROM users u
	JOIN orders o
		ON u.user_id = o.user_id
	WHERE order_status = "completed"
	GROUP BY gender
    ORDER BY total_sales
    DESC;

-- . Average sales by gender
	SELECT gender, avg(total_amount) AS Avg_sales
    FROM users u
	JOIN orders o
		ON u.user_id = o.user_id
	WHERE order_status = "completed"
	GROUP BY gender
    ORDER BY avg_sales
    DESC;
    
-- .top 5 cities by total sales
	SELECT u.city, sum(total_amount)
    as total_sales
    FROM users u
    JOIN orders o
		ON u.user_id = o.user_id
	WHERE order_status = "completed"
	GROUP BY city
    ORDER BY total_sales DESC
    limit 5;

-- .top 5 cities by Avg sales
	SELECT u.city, avg(total_amount)
    as avg_sales
    FROM users u
    JOIN orders o
		ON u.user_id = o.user_id
	WHERE order_status = "completed"
	GROUP BY city
    ORDER BY avg_sales DESC
    limit 5;

-- Cities by total orders
	SELECT city, COUNT(order_id) as total_orders
    FROM users u
    JOIN orders o
		on u.user_id = o.user_id
	GROUP BY city
    ORDER BY total_orders
    DESC
    LIMIT 10;
    
-- Frequently buying customers
	SELECT u.user_id,name, COUNT(order_id) as total_orders
    FROM users u
    JOIN orders oi
		ON u.user_id = oi.user_id
	WHERE order_status = "completed"
	GROUP BY user_id, name
    ORDER BY total_orders
    DESC;

-- Top 5 Highest Spending Customers
	SELECT name, sum(total_amount) as total_amount
    FROM users u
	JOIN orders o
		ON u.user_id = o.user_id
	WHERE order_status = "completed"
	GROUP BY name
    ORDER BY total_amount DESC
    limit 5;
    
-- .citites with most cancellations orders
	SELECT city, COUNT(order_id) as total_cancelled_orders
    FROM orders o
    JOIN users u
		on o.user_id = u.user_id
	WHERE order_status = "cancelled"
    GROUP BY city
    ORDER BY total_cancelled_orders
    DESC limit 10
