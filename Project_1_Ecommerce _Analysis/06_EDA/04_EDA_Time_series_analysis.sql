-- ===============================================================
--               Expolatory Data Analysis (EDA)
-- ===============================================================

-- EDA Time series analysis
-- What we find here?

-- 1.total sale by year
-- 2.Montly sales trend
-- 3.Month by highest sale
-- 4.Month by lowest sale
-- 5 MoM growth

-- 1.total sale by year
	SELECT YEAR(order_date) as 'Year',
    SUM(total_amount) as total_amount
    FROM orders
    WHERE order_status = "completed"
	GROUP BY YEAR(order_date)
    ORDER BY `YEAR`;

-- 2.Montly sales trend
	SELECT date_format(order_date, '%Y-%m') as 'date',
    SUM(total_amount) as total_amount
    FROM orders
    where order_status = "completed"
	GROUP BY date_format(order_date, '%Y-%m')
    ORDER BY `date`;

-- 3.Month by highest salea
    SELECT date_format(order_date, '%Y-%m') as 'date',
    SUM(total_amount) as total_amount
    FROM orders
    WHERE order_status = "completed"
	GROUP BY date_format(order_date, '%Y-%m')
    ORDER BY `total_amount` DESC
    LIMIT 1;

-- 4.Month by lowest sale
	SELECT date_format(order_date, '%Y-%m') as 'date',
    SUM(total_amount) as total_amount
    FROM orders
	WHERE order_status = "completed"
	GROUP BY date_format(order_date, '%Y-%m')
    ORDER BY `total_amount` 
    LIMIT 1;

-- 5 MoM growth
	CREATE TEMPORARY TABLE monthly_trend
    SELECT date_format(order_date, '%Y-%m') as 'month',
    SUM(total_amount) as current_month
    FROM orders
    where order_status = "completed"
	GROUP BY date_format(order_date, '%Y-%m')
    ORDER BY `month`;
    
    CREATE TEMPORARY TABLE monthly_trend2
    SELECT *, LAG(current_month)
    OVER(ORDER BY `month`) as previous_month
    FROM monthly_trend;
    
    SELECT *, 
    concat(round((current_month - previous_month) / previous_month * 100, 2),'%')
    AS 'MoM Growth%'
    FROM monthly_trend2;
    
   