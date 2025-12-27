
USE starbucks_db;

SELECT *
FROM  starbucks_sales
LIMIT 5;

-- 1. Which store location generates the highest total revenue?
SELECT store_location,
       SUM(transaction_qty * unit_price) AS total_revenue
FROM starbucks_sales
GROUP BY store_location
ORDER BY total_revenue DESC;



-- 2. What are the top 10 best-selling products based on total quantity sold?

SELECT product_detail,
       SUM(transaction_qty) AS total_quantity
FROM starbucks_sales
GROUP BY product_detail
ORDER BY total_quantity DESC
LIMIT 10;



-- 3. How does daily sales revenue change over time?
SELECT transaction_date,
       SUM(transaction_qty * unit_price) AS daily_revenue
FROM starbucks_sales
GROUP BY transaction_date
ORDER BY transaction_date;


-- 4. Which product category contributes the most to overall revenue?
SELECT product_category,
       SUM(transaction_qty * unit_price) AS category_revenue
FROM starbucks_sales
GROUP BY product_category
ORDER BY category_revenue DESC;

-- 5. At what hours of the day do customers make the most purchases?
SELECT HOUR(transaction_time) AS hour_of_day,
       SUM(transaction_qty) AS total_quantity
FROM starbucks_sales
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- 6. Which store location has the highest average order value (AOV)?
SELECT store_location,
       AVG(transaction_qty * unit_price) AS avg_order_value
FROM starbucks_sales
GROUP BY store_location
ORDER BY avg_order_value DESC;

-- 7. How are sales distributed across different product types?
SELECT product_type,
       SUM(transaction_qty) AS total_quantity
FROM starbucks_sales
GROUP BY product_type
ORDER BY total_quantity DESC;

-- 8. How do sales revenues differ between weekdays and weekends?
SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    SUM(transaction_qty * unit_price) AS total_revenue
FROM starbucks_sales
GROUP BY day_type;

-- 9. Which products generate high revenue but are sold in low quantities?
SELECT product_detail,
       SUM(transaction_qty) AS total_quantity,
       SUM(transaction_qty * unit_price) AS total_revenue
FROM starbucks_sales
GROUP BY product_detail
ORDER BY total_revenue DESC;

ALTER USER 'root'@'localhost'
IDENTIFIED WITH mysql_native_password
BY 'keshav@123';

FLUSH PRIVILEGES;

SHOW VARIABLES LIKE 'port';
