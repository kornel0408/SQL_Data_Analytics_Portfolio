-- ======================================================
					-- 	DATA CLEANING
-- ======================================================

-- ----------------------------------
--  events TABLE DATA CLEANING
-- ----------------------------------

-- 1. Null value checking
SELECT *
FROM events
WHERE event_id IS NULL
OR user_id IS NULL
OR product_id IS NULL
OR event_type IS NULL
OR event_timestamp IS NULL;

-- 2. Finding Duplicate rows
SELECT *,
COUNT(*) as 'count'
FROM events
GROUP BY event_id,
		user_id,
        product_id,
        event_type,
        event_timestamp
HAVING count(*) > 1;

-- 3.Invalid categories

SELECT DISTINCT 
event_type
FROM events;

