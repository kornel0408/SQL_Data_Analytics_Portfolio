-- ======================================================
					-- 	DATA CLEANING
-- ======================================================

-- Null value checks
-- Duplicate primary key checks
-- Duplicate important columns checks
-- Invalid numeric values
-- Invalid dates
-- Invalid categories
-- --------------------------------
--  REVIEWS TABLE DATA CLEANING
-- --------------------------------
DESC reviews;

SELECT * FROM
events
WHERE event_id IS NULL OR user_id IS NULL
OR product_id IS NULL OR event_type IS NULL
OR event_timestamp IS NULL;

SELECT * FROM
events
WHERE event_id = '' OR user_id = ''
OR product_id = '' OR event_type = ''
;

with dup_check as (
SELECT *, RANK()
OVER (PARTITION BY event_id, user_id, product_id, event_type,event_timestamp)
as rnk
from events )

SELECT * FROM dup_check
WHERE rnk > 1;

SELECT review_id, count(*) as review_id_count
from reviews
GROUP BY review_id
having count(*) > 0;

SELECT *
FROM reviews
WHERE STR_TO_DATE(review_date, '%Y-%m-%d') IS NULL;

SELECT * FROM
reviews
WHERE rating > 5 OR rating < 0;



