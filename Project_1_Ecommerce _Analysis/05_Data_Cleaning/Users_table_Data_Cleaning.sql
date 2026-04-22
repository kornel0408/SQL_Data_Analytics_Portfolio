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
--  Users TABLE DATA CLEANING
-- --------------------------------

DESC users;

-- 1. Null value checking

SELECT *
FROM users
WHERE user_id IS NULL or name IS NULL 
or email IS NULL or gender IS NULL
or city IS NULL or signup_date IS NULL;

SELECT *
FROM users
WHERE user_id = '' or name = ''
or email = '' or gender = ''
or city = '' ;


SELECT user_id, count(*) as id_count
FROM users
GROUP BY user_id
HAVING count(*) > 1;


-- 2. Finding Duplicate rows

WITH find_dup as(
SELECT *, 
RANK() OVER(PARTITION BY user_id, name, email, gender, city, signup_date) AS rnk
FROM users
)

SELECT * FROM 
find_dup WHERE rnk > 1;

-- 3. Invalid dates
SELECT *
FROM reviews
WHERE STR_TO_DATE(review_date, '%Y-%m-%d') IS NULL;

-- 4. Invalid categories
SELECT DISTINCT gender
FROM users;

SELECT email, count(email) as count
FROM users
GROUP BY email
HAVING count(email) > 1;

SELECT email
FROM users
WHERE email NOT LIKE '%@%.%'


