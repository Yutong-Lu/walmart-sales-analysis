-- Create database
CREATE DATABASE IF NOT EXISTS walmart;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT,
    gross_income DECIMAL(12, 4) NOT NULL,
    rating FLOAT
);

-- -------------------------------------------------------------------

/* 
Feature Engineering
*/

-- time_of_day

SELECT 
	time,
    (CASE
		WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'morning'
        WHEN `time` BETWEEN '12:00:01' AND '16:00:00' THEN 'afternoon'
        ELSE 'evening'
    END 
    ) AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'morning'
        WHEN `time` BETWEEN '12:00:01' AND '16:00:00' THEN 'afternoon'
        ELSE 'evening'
    END 
);
SET SQL_SAFE_UPDATES = 1;

-- day_name
SELECT 
	date,
    DAYNAME(date) AS day_name
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;
UPDATE sales
SET day_name = DAYNAME(date);
SET SQL_SAFE_UPDATES = 1;

-- month name

ALTER TABLE sales ADD COLUMN month_name VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;
UPDATE sales
SET month_name = MONTHNAME(date);
SET SQL_SAFE_UPDATES = 1;

-- --------------------------------------------------------------------

/* 
Exploratory Data Analysis
*/

-- -----------------------Generic Questions----------------------------

-- How many unique cities does the data have?

SELECT DISTINCT city
FROM sales;

-- In which city is each branch?

SELECT DISTINCT branch
FROM sales;

SELECT DISTINCT city, branch
FROM sales;

-- -----------------------------Products------------------------------

-- How many unique product lines does the data have?

SELECT COUNT(DISTINCT product_line)
FROM sales;

-- What is the most common payment method?

SELECT 
	payment_method,
	COUNT(payment_method) AS count
FROM sales
GROUP BY payment_method
ORDER BY count DESC;

-- What is the most selling product line?

SELECT 
	product_line,
	COUNT(product_line) AS count
FROM sales
GROUP BY product_line
ORDER BY count DESC;

-- What is the total revenue by month?

SELECT 
	month_name,
	SUM(unit_price * quantity) AS total_revenue -- or just SUM(total)
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- What month had the largest COGS?

SELECT 
	month_name,
	SUM(cogs) AS total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC;

-- What product line had the largest revenue?

SELECT 
	product_line,
	SUM(total) AS rev_per_product
FROM sales
GROUP BY product_line
ORDER BY rev_per_product DESC;

-- What is the city with the largest revenue?

SELECT 
	city,
	branch, -- add branch for more info
	SUM(total) AS rev_per_city
FROM sales
GROUP BY city, branch
ORDER BY rev_per_city DESC;

-- What product line had the largest VAT?

SELECT 
	product_line,
	AVG(VAT) AS avg_vat
FROM sales
GROUP BY product_line
ORDER BY avg_vat DESC;

-- Which branch sold more products than average product sold?
SELECT 
	branch,
	SUM(quantity) AS total_quantity
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- What is the most common product line by gender?
SELECT 
    gender,
    product_line,
    COUNT(product_line) AS count
FROM sales
GROUP BY gender, product_line
ORDER BY gender, count DESC;

-- What is the average rating of each product line?

SELECT 
    product_line,
    ROUND(AVG(rating),2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- -----------------------Customer Questions-------------------------

-- How many unique customer types does the data have?

SELECT DISTINCT customer_type
FROM sales;

SELECT COUNT(DISTINCT customer_type)
FROM sales;

-- What is the most common customer type?

SELECT customer_type, COUNT(customer_type) AS count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;

-- What is the gender of most of the customers?

SELECT gender, COUNT(*) AS count
FROM sales
GROUP BY gender
ORDER BY count DESC;

-- What is the gender distribution per branch?

SELECT branch, gender, COUNT(branch) as count
FROM sales
GROUP BY gender, branch
ORDER BY branch, gender;

-- Which time of the day do customers give the most ratings?

SELECT time_of_day, ROUND(AVG(rating),2) AS avg_ratings
FROM sales
GROUP BY time_of_day
ORDER BY avg_ratings DESC;

-- Which time of the day do customers give the most ratings per branch?

SELECT branch, time_of_day, ROUND(AVG(rating),2) AS avg_ratings
FROM sales
GROUP BY branch, time_of_day
ORDER BY branch, avg_ratings DESC;

-- Which day of the week has the best average ratings?

SELECT day_name, ROUND(AVG(rating),2) AS avg_ratings
FROM sales
GROUP BY day_name
ORDER BY avg_ratings DESC;

-- Which day of the week has the best average ratings per branch?

SELECT branch, day_name, ROUND(AVG(rating),2) AS avg_ratings
FROM sales
GROUP BY day_name, branch
ORDER BY branch, avg_ratings DESC;